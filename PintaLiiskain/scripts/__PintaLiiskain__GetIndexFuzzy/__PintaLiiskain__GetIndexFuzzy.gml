

/**
* Get index for smallest surface, which is large enough to fit given layout.
* -> If not found, then undefined is returned instead.
* 
* @context PintaLiiskain
* @param {Constant.SurfaceFormatType} _format  Which format reducer uses.
* @returns {Undefined | Real}
*/ 
function __PintaLiiskain__GetIndexFuzzy(_w, _h)
{
  var _count = array_length(self.layouts);
  for(var i = _count - 1; i >= 0; i--)
  {
    var _layout = self.layouts[0];
    if (_w <= _layout[0])
    && (_h <= _layout[1])
    {
      return i;
    }
  }
  
  return undefined;
}