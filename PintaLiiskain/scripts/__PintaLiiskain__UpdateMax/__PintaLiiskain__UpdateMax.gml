

/**
* Updates all surfaces in cascading order.
* The shader finds the maximum value for reduction.
* 
* Have to be applied in Draw-event!
* 
* @context PintaLiiskain
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__UpdateMax()
{
  return self.Update(SHD_PintaLiiskain_Max);
}

