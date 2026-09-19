//=============================================================
// 
// Uses regular rgba8unorm textures to encode single 32bit integer.
// -> This allows summing up more than f32 could, but also works
//    with platforms which doesn't have f32 support.
// 
// Single pixel stores 32bit integer, encoded as :
//   R - 0x00_00_00_FF Least significant byte.
//   G - 0x00_00_FF_00 
//   B - 0x00_FF_00_00 
//   A - 0xFF_00_00_00 Most significant byte.
// 
// Can be decoded in shader by doing dot product with: vec4(1.0, 256.0, 65536.0, 16777216.0)
// -> Note that shader floats can't represent the highest numbers.
// 
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
  
  
  // Sample the corners.
  // Transform into whole numbers to avoid float-point precision issues.
  vec4 sampleA = floor(texture2D(gm_BaseTexture, coords.xy) * 255.0 + 0.5);
  vec4 sampleB = floor(texture2D(gm_BaseTexture, coords.xy) * 255.0 + 0.5);
  vec4 sampleC = floor(texture2D(gm_BaseTexture, coords.xy) * 255.0 + 0.5);
  vec4 sampleD = floor(texture2D(gm_BaseTexture, coords.xy) * 255.0 + 0.5);
  vec4 summation = (sampleA + sampleB + sampleC + sampleD);
  
  
  // Resolve carries over the bytes.
  if (summation[0] > 255.5) { summation.rg += vec2(-256.0, +1.0); } 
  if (summation[1] > 255.5) { summation.gb += vec2(-256.0, +1.0); } 
  if (summation[2] > 255.5) { summation.ba += vec2(-256.0, +1.0); } 
  
  
  // Normalize the result back to range of 0.0 to 1.0
  gl_FragColor = (summation / 255.0);
}


//=============================================================
