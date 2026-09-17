

/**
* Closes the use of AssignBegin
* 
* @context PintaLiiskain
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__AssignEnd()
{
  surface_reset_target();
  gpu_pop_state();
}