

/**
* Updates all surfaces in cascading order.
* The shader finds the minimum value for reduction.
* 
* This needs to use rgba32float or r32float -format! 
* Have to be applied in Draw-event!
* 
* @context PintaLiiskain
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__ReduceSum()
{
  return self.Reduce(SHD_PintaLiiskain_Sum);
}

