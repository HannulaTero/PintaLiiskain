

/**
* Set the starting maximum layout size for reducer.
* NOTE! This doesn't enforce power of two, but expects it to work fully.
*
* The non-power of two layouts are allowed, but may produce incorrect results.
* -> The odd-numbered edge is trimmed out in each cascading surface.
* 
* This frees previous surfaces.
* 
* @context PintaLiiskain
* @param {Real} _w 
* @param {Real} _h 
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__SetLayout(_w, _h)
{
  // Get the maximum layout.
  self.maxLayout[0] = _w; 
  self.maxLayout[1] = _h; 
  
  
  // Clear previous data.
  self.Free();
  array_resize(self.surfaces, 0);
  array_resize(self.layouts, 0);
  
  
  // Reserve the slots.
  var _index = 0;
  var _iterW = self.maxLayout[0];
  var _iterH = self.maxLayout[1];
  while((_iterW >= 1) || (_iterH >= 1))
  {
    // Add new surface-slot.
    array_push(self.surfaces, undefined);
    
    // Add layout for new surface.
    array_push(self.layouts, [ 
      max(1, _iterW), 
      max(1, _iterH)
    ]);
    
    // Next iteration.
    _iterW = floor(_iterW * 0.5);
    _iterH = floor(_iterH * 0.5);
  }
  
  return self;
}