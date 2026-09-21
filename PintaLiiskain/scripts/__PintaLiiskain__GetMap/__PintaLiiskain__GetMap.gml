

/**
* Creates surface and copies all results there.
* Returns undefined if couldn't complete the task (surfaces didn't exist).
* 
* @context PintaLiiskain
* @returns {Undefined | Id.Surface}
*/ 
function __PintaLiiskain__GetMap()
{
  // Sanity check.
  if (array_length(self.layouts) < 2)
  || (self.Exists() == false)
  {
    return undefined;
  }
  
  
  // Create the target surface.
  var _w = self.layouts[0][0] + self.layouts[1][0];
  var _h = self.layouts[0][1];
  var _mapping = surface_create(_w, _h, self.formatType);
  
  
  // Copy over the results.
  __PintaLiiskain__GetMapExt(_mapping);
  
  return _mapping;
}