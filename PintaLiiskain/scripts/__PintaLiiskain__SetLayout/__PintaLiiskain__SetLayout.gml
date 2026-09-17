

/**
* Set the starting maximum layout size for reducer.
* NOTE! This enforces the power of two!
* This removes previous surfaces.
* 
* @context PintaLiiskain
* @param {Real} _w 
* @param {Real} _h 
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__SetLayout(_w, _h)
{
  // Get the maximum layout.
  self.maxLayout[0] = power(2, ceil(log2(_w)));
  self.maxLayout[1] = power(2, ceil(log2(_h)));
  if (_w != self.maxLayout[0])
  || (_h != self.maxLayout[1])
  {
    throw("[PintaLiiskain] Given layout was not power of two.");
  }
  
  
  // Clear previous data.
  self.Free();
  array_resize(self.surfaces, 0);
  array_resize(self.layouts, 0);
  delete self.indexMapping;
  self.indexMapping = { };
  
  
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
    
    // Make lookup-entry for finding the surface index.
    var _key = $"[{_iterW}, {_iterH}]";
    self.indexMapping[$ _key] = _index++;
    
    // Next iteration.
    _iterW = floor(_iterW * 0.5);
    _iterH = floor(_iterH * 0.5);
  }
  
  return self;
}