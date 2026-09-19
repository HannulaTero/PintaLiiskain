//=============================================================
// 
// Uses regular rgba8unorm textures to encode single 32bit integer.
// Single pixel stores 32bit integer, encoded as :
//   R - 0x00_00_00_FF Least significant byte.
//   G - 0x00_00_FF_00 
//   B - 0x00_FF_00_00 
//   A - 0xFF_00_00_00 Most significant byte.
// 
//=============================================================


// Uniforms.
// Channel-mask is hot-encoded vector.
uniform vec4 FSH_ChannelMask;

uniform vec2 FSH_Layout;


//=============================================================


void main()
{
  // Get the sample.
  vec2 origin = floor(gl_FragCoord.xy);
  vec2 coord  = (origin + 0.5) / FSH_Layout;
  vec4 sample = texture2D(gm_BaseTexture, coord);
  
  
  // Get the channel out from hot-encoded vector.
  // Otherwise would require dynamic indexing, which WebGL1 doesn't support.
  float channel = dot(sample, FSH_ChannelMask);
  
  
  // Return the selected value. 
  gl_FragColor = vec4(channel, 0.0, 0.0, 0.0);
}


//=============================================================
