

/**
* This is done to allow arbitrary assignment.
* Sets initial surface as target, which you may update however you want by drawing.
* Remmeber to close with AssignEnd.
* 
* @context PintaLiiskain
* @param {Bool} _blendable
* @param {Bool} _texFilter
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__AssignBegin(_blendable=false, _texFilter=false)
{
  // Preparations.
  self.Verify();
  var _count = array_length(self.surfaces);
  if (_count <= 0)
  {
    return;
  }
  
  
  gpu_push_state();
  gpu_set_tex_filter(_texFilter);
  gpu_set_blendenable(_blendable);
  surface_set_target(self.surfaces[0]);
}