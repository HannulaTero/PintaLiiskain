

/**
* Updates all surfaces in cascading order.
* The shader finds the minimum value for reduction.
* 
* Have to be applied in Draw-event!
* 
* @context PintaLiiskain
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__ReduceMin()
{
  return self.Reduce(SHD_PintaLiiskain_Min);
}

