

/**
* Updates all surfaces in cascading order.
* The shader finds the minimum value for reduction.
* 
* Uses regular rgba8unorm textures to encode single 32bit integer.
* -> This allows summing up more than f32 could, but also works
*    with platforms which doesn't have f32 support.
* -> This does mean only single color channel is summed.
* 
* Single pixel stores 32bit integer, encoded as :
*   R - 0x00_00_00_FF Least significant byte.
*   G - 0x00_00_FF_00 
*   B - 0x00_FF_00_00 
*   A - 0xFF_00_00_00 Most significant byte.
* 
* In shader this can decoded by doing dot product with: vec4(1.0, 256.0, 65536.0, 16777216.0)
* -> Note that shader floats can't represent the highest numbers.
* 
* Note for small input sizes,  the results might visually seem invisible, 
* as alpha represent most significant byte. 
* The resulting values might not just be enough to get into alpha-byte.
* But the color channels contain the value anyways.
* 
* When reading back to CPU, you don't need to do any decoding,
* instead you should be able to just use "buffer_u32" to read the value.
* 
* Have to be applied in Draw-event!
* 
* @context PintaLiiskain
* @param {Real} _channel  Which color channel is chosen from input [ R, G, B, A ]
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__ReduceUNormSum(_channel=0)
{
  static shader           = SHD_PintaLiiskain_UNormSeed;
  static FSH_ChannelMask  = shader_get_uniform(shader, "FSH_ChannelMask");
  static FSH_Layout       = shader_get_uniform(shader, "FSH_Layout");
  static channelMask      = [ 0, 0, 0, 0 ];
  
  
  // Verify there are required surfaces.
  self.Verify();
  var _count = array_length(self.surfaces);
  if (_count <= 0)
  {
    return;
  }
  
  if (surface_exists(self.temporal) == false)
  {
    var _layout = self.layouts[0];
    self.temporal = surface_create(_layout[0], _layout[1], self.formatType);
  }
  
  
  // Get hot-encoded vector, telling which channel is being targeted..
  array_map_ext(channelMask, function() { return 0.0; });
  channelMask[_channel] = 1.0;
  
  
  // Apply the passes.
  gpu_push_state();
  gpu_set_state(__PintaLiiskainGPUState());
  {
    shader_set(shader);
    shader_set_uniform_f_array(FSH_ChannelMask, channelMask);
    shader_set_uniform_f_array(FSH_Layout, self.layouts[0]);
    surface_set_target(self.temporal);
    draw_surface(self.surfaces[0], 0, 0);
    surface_reset_target();
    shader_reset();
  }
  gpu_pop_state();
  
  
  // Update the cascading surfaces.
  // Swap temporarily first surface and temporal.
  // This way towards to user, the first surface stays same, 
  // like with the other Reduce-methods.
  var _original = self.surfaces[0];
  self.surfaces[0] = self.temporal;
  self.Reduce(SHD_PintaLiiskain_UNormSum);
  self.surfaces[0] = _original;
  return self;
}

