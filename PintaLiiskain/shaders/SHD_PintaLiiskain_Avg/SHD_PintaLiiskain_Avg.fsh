//=============================================================


// Uniforms.
uniform vec2 FSH_SrcLayout;


//=============================================================


void main()
{
  // Output origin in exact pixel position.
  vec2 origin = floor(gl_FragCoord.xy);
  
  
  // Calculate the sample corners.
  vec4 corners;
  corners.xy = origin * 2.0;
  corners.zw = origin * 2.0 + 1.0;
  
  
  // Calculate texture coordinates.
  vec4 coords = (corners + 0.5) / FSH_SrcLayout.xyxy;
  
  
  // Sample the corners, and get the average.
  vec4 avergage = 0.25 * (
    texture2D(gm_BaseTexture, coords.xy) +
    texture2D(gm_BaseTexture, coords.xw) +
    texture2D(gm_BaseTexture, coords.zy) +
    texture2D(gm_BaseTexture, coords.zw)
  );
  
    
  // Return the result.
  gl_FragColor = avergage;
}


//=============================================================
