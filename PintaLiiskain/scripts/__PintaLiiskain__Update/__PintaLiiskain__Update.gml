

/**
* Updates all surfaces.
* Have to be applied in Draw-event!
* 
* @context PintaLiiskain
* @param {Asset.GMShader} _shader
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__Update(_shader=SHD_PintaLiiskain_Average)
{
  // Preparations.
  self.Verify();
  var _count = array_length(self.surfaces);
  if (_count <= 0)
  {
    return;
  }
  var _FSH_SrcLayout = shader_get_uniform(_shader, "FSH_SrcLayout");
  
  
  // Apply the passes.
  gpu_push_state();
  gpu_set_tex_filter(false);
  gpu_set_blendenable(false);
  gpu_set_blendmode_ext(bm_one, bm_zero);
  shader_set(_shader);
  for(var i = 1; i < _count; i++)
  {
    // Set the uniforms.
    var _dstLayout = self.layouts[i];
    var _srcLayout = self.layouts[i - 1];
    shader_set_uniform_f_array(_FSH_SrcLayout, _srcLayout);
    
    // Render.
    surface_set_target(self.surfaces[i]);
    draw_surface_stretched(self.surfaces[i - 1], 0, 0, _dstLayout[0], _dstLayout[1]);
    surface_reset_target();
  }
  shader_reset();
  gpu_pop_state();
}


