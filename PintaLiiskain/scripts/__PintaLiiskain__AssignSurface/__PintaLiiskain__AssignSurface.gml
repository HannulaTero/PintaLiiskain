

/**
* Assign the given surface as initial source.
* This is stretched to cover the whole area.
* 
* @context PintaLiiskain
* @param {Id.Surface} _surface
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__AssignSurface(_surface)
{
  // Preparations.
  self.Verify();
  var _count = array_length(self.surfaces);
  if (_count <= 0)
  {
    return;
  }
  
  
  // Apply the surface.
  gpu_push_state();
  gpu_set_state(__PintaLiiskainGPUState());
  surface_set_target(self.surfaces[0]);
  draw_surface_stretched(_surface, 0, 0, self.maxLayout[0], self.maxLayout[1]);
  surface_reset_target();
  gpu_pop_state();
}