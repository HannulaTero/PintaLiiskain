

/**
* Pushes the mapping to existing surface.
* You must ensure to use the correct size by yourself (GetMapLayout)
* 
* @context PintaLiiskain
* @param {Id.Surface} _target
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__GetMapExt(_target)
{
  // Sanity check.
  if (array_length(self.layouts) < 2)
  || (self.Exists() == false)
  {
    throw("[PintaLiiskain] GetMap, ensure surfaces exist first!");
    return self;
  }
  
  
  // Copy over the results.
  var _count = array_length(self.surfaces);
  var _x = self.layouts[0][0];
  var _y = 0;
  gpu_push_state();
  gpu_set_state(__PintaLiiskainGPUState());
  {
    surface_set_target(_target);
    draw_clear_alpha(c_black, 0.0);
    draw_surface(self.surfaces[0], 0, 0);
    for(var i = 1; i < _count; i++)
    {
      draw_surface(self.surfaces[i], _x, _y);
      _y += self.layouts[i][1];
    }
    surface_reset_target();
  }
  gpu_pop_state();
  
  
  // 
  return self;
}