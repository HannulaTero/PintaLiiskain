

/**
* Frees all surfaces, after this reducer can be left for garbage collection.
* You can also use this for "free the cache", as if you use reducer after freeing, 
* it will recreate the surfaces.
* 
* @context PintaLiiskain
*/ 
function __PintaLiiskain__Free()
{
  array_foreach(self.surfaces, function(_surface, _index)
  {
    if (surface_exists(_surface) == true)
    {
      surface_free(_surface);
    }
  });
}