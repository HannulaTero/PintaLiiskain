

/**
* Returns the layout for mapping, which can be used to create surface,
* which can be provided to GetMapExt.
* 
* @context PintaLiiskain
* @returns {Array<Real>}
*/ 
function __PintaLiiskain__GetMapLayout()
{
  // Sanity check.
  if (array_length(self.layouts) < 2)
  {
    return [ self.layouts[0][0], self.layouts[0][1] ];
  }
    
  
  // 
  return [ 
    self.layouts[0][0] + self.layouts[1][0], 
    self.layouts[0][1] 
  ];
}