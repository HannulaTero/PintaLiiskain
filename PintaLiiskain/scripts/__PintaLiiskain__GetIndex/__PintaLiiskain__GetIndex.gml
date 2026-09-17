

/**
* Get surface index for given layout size.
* -> If not found, then undefined is returned instead.
* 
* @context PintaLiiskain
* @param {Constant.SurfaceFormatType} _format  Which format reducer uses.
* @param {Undefined | Real}
*/ 
function __PintaLiiskain__GetIndex(_w, _h)
{
  var _key = $"[{_w}, {_h}]";
  return self.indexMapping[$ _key];
}