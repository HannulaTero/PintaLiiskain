

/**
* Updates all surfaces in cascading order.
* The shader finds the average value for reduction.
* 
* Have to be applied in Draw-event!
* 
* @context PintaLiiskain
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__UpdateAvg()
{
  return self.Update(SHD_PintaLiiskain_Avg);
}


