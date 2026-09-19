

/**
* Returns whether reducer contains valid surface data.
* 
* @context PintaLiiskain
* @returns {Bool}
*/ 
function __PintaLiiskain__Exists()
{
  return array_all(self.surfaces, function(_surface, _index)
  {
    return surface_exists(_surface);
  });
}