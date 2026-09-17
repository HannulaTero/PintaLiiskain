

/**
* Set the surface format reducer uses.
* This removes previous surfaces.
* 
* @context PintaLiiskain
* @param {Constant.SurfaceFormatType} _format  Which format reducer uses.
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__SetFormat(_format)
{
  self.Free();
  self.formatType = _format;
  return self;
}