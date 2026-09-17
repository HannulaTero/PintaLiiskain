

/**
* Surface Reducer, reduces.
* Stores mid-steps, which can b eaccessed if needed.
* 
* @param {Real} _w  Maximum width reducer operates at. Must be power of two!
* @param {Real} _h  Maximum height reducer operates at. Must be power of two!
* @param {Constant.SurfaceFormatType} _format  Which format reducer uses.
*/ 
function PintaLiiskain(_w, _h, _format=surface_rgba8unorm) constructor
{
  //=============================================================
  // 
  #region PUBLIC : STATIC METHODS.
  
  
  static AssignBegin    = __PintaLiiskain__AssignBegin;
  static AssignEnd      = __PintaLiiskain__AssignEnd;
  static AssignSprite   = __PintaLiiskain__AssignSprite;
  static AssignSurface  = __PintaLiiskain__AssignSurface;
  static Free           = __PintaLiiskain__Free;
  static GetIndex       = __PintaLiiskain__GetIndex;
  static SetFormat      = __PintaLiiskain__SetFormat;
  static SetLayout      = __PintaLiiskain__SetLayout;
  static Update         = __PintaLiiskain__Update;
  static Verify         = __PintaLiiskain__Verify;
  
  
  #endregion
  // 
  //=============================================================
  // 
  #region PRIVATE : STRUCT INSTANCE VARIABLES.
  
  
  // The maximum acceptable dimension.
  self.maxLayout = [ 1, 1 ];
  
  
  // Layouts for each surface.
  self.layouts = [ ];
  
  
  // Format type surfaces use.
  self.formatType = surface_rgba8unorm;
  
  
  // The cascading surfaces with diminishing size.
  self.surfaces = [ ];
  
  
  // Layout to index-mapping.
  self.indexMapping = { };
  
  
  #endregion
  // 
  //=============================================================
  // 
  #region HANDLE CONSTRUCTION.
  
  
  self.SetLayout(_w, _h);
  
  self.SetFormat(_format);
  
  
  #endregion
  // 
  //=============================================================
}


