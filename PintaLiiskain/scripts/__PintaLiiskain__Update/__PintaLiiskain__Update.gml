

/**
* Updates all surfaces with given shader in cascading order.
* Acceptable strings (lower or upper-case) are : 
* - AVG, MAX, MIN, SUM, UNORM-SUM
* 
* If providing custom shader, the shader can have uniforms:
* - "FSH_DstLayout" 
* - "FSH_SrcLayout"
* 
* Have to be applied in Draw-event!
* 
* @context PintaLiiskain
* @param {Asset.GMShader | String} _shader 
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__Update(_shader=SHD_PintaLiiskain_Avg)
{
  // Chooe correct shader.
  if (is_string(_shader) == true)
  {
    switch(string_upper(_shader))
    {
      case "AVG": _shader = SHD_PintaLiiskain_Avg; break;
      case "MAX": _shader = SHD_PintaLiiskain_Max; break;
      case "MIN": _shader = SHD_PintaLiiskain_Min; break;
      case "SUM": _shader = SHD_PintaLiiskain_Sum; break;
      case "UNORM-SUM": _shader = SHD_PintaLiiskain_UNormSum; break;
      default: {
        show_debug_message($"[PintaLiiskain] Unknown shader: {_shader}");
        return;
      }
    }
  }
  
  
  // Preparations.
  self.Verify();
  var _count = array_length(self.surfaces);
  if (_count <= 0)
  {
    return;
  }
  var _FSH_DstLayout = shader_get_uniform(_shader, "FSH_DstLayout");
  var _FSH_SrcLayout = shader_get_uniform(_shader, "FSH_SrcLayout");
  
  
  // Apply the passes.
  gpu_push_state();
  gpu_set_state(__PintaLiiskainGPUState());
  shader_set(_shader);
  for(var i = 1; i < _count; i++)
  {
    // Set the uniforms.
    var _dstLayout = self.layouts[i];
    var _srcLayout = self.layouts[i - 1];
    shader_set_uniform_f_array(_FSH_DstLayout, _dstLayout);
    shader_set_uniform_f_array(_FSH_SrcLayout, _srcLayout);
    
    
    // Render.
    surface_set_target(self.surfaces[i]);
    draw_surface_stretched(self.surfaces[i - 1], 0, 0, _dstLayout[0], _dstLayout[1]);
    surface_reset_target();
  }
  shader_reset();
  gpu_pop_state();
  
  
  // 
  return self;
}


