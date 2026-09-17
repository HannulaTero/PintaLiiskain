

/**
* Ensures that surfaces exist. If not, then they are created.
* 
* @context PintaLiiskain
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__Verify()
{
  array_foreach(self.surfaces, function(_surface, _index)
  {
    if (surface_exists(_surface) == false)
    {
      var _layout = self.layouts[_index];
      self.surfaces[_index] = surface_create(_layout[0], _layout[1], self.formatType);
    }
  });
  
  return self;
}