

/**
* Returns surface for given index.
* Returns undefined if non-valid index, or surface doesn't exist.
* 
* @context PintaLiiskain
* @param {Real} _index
* @returns {Undefined | Id.Surface}
*/ 
function __PintaLiiskain__GetSurface(_index)
{
  if (_index < 0)
  || (_index >= array_length(self.surfaces))
  {
    return undefined;
  }
  
  return self.surfaces[_index];
}