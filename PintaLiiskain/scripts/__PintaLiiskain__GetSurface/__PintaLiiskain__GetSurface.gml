

/**
* Returns surface for given index.
* Returns undefined if non-valid index, or surface doesn't exist.
* You can give negative index to access from in reverse order.
* 
* @context PintaLiiskain
* @param {Real} _index
* @returns {Undefined | Id.Surface}
*/ 
function __PintaLiiskain__GetSurface(_index)
{
  // Allow negative indexes.
  if (_index < 0)
  {
    _index = array_length(self.surfaces) - _index;
  }
  
  // Whether in the range.
  if (_index < 0)
  || (_index >= array_length(self.surfaces))
  {
    return undefined;
  }
  
  return self.surfaces[_index];
}