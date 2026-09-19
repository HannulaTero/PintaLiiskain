

/**
* Surface Reducer, reduces the input in cascading manner with selected Updated-method..
* Stores mid-steps, which can be accessed later, if needed.
* 
* @param {Real} _w  Maximum width reducer operates at. 
* @param {Real} _h  Maximum height reducer operates at. 
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
  static Exists         = __PintaLiiskain__Exists;
  static Free           = __PintaLiiskain__Free;
  static GetIndexExact  = __PintaLiiskain__GetIndexExact;
  static GetIndexFuzzy  = __PintaLiiskain__GetIndexFuzzy;
  static GetMap         = __PintaLiiskain__GetMap;
  static GetMapExt      = __PintaLiiskain__GetMapExt;
  static GetMapLayout   = __PintaLiiskain__GetMapLayout;
  static GetSurface     = __PintaLiiskain__GetSurface;
  static SetFormat      = __PintaLiiskain__SetFormat;
  static SetLayout      = __PintaLiiskain__SetLayout;
  static Update         = __PintaLiiskain__Update;
  static UpdateAvg      = __PintaLiiskain__UpdateAvg;
  static UpdateMax      = __PintaLiiskain__UpdateMax;
  static UpdateMin      = __PintaLiiskain__UpdateMin;
  static UpdateSum      = __PintaLiiskain__UpdateSum;
  static UpdateUNormSum = __PintaLiiskain__UpdateUNormSum;
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
  
  
  // Helper surface.
  self.temporal = undefined;
  
  
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


