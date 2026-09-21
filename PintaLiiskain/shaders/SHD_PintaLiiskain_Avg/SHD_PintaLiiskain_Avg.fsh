//=============================================================


// Uniforms.
uniform vec2 FSH_SrcLayout;


//=============================================================


void main()
{
  // Calculate texture coordinates.
  // gl_FragCoord.xy is always offset of 0.5 (in GameMaker you can't change that)
  // So top-left pixel position is [ 0.5, 0.5 ], not [ 0, 0 ]
  // The pixel center is considered as middle-point, which is why
  // that's better point to sample if you want exact value.
  // Sampling at [ 1, 1 ] will interpolate between four samples actually from.
  // 
  // Here input position is calculated from output position, which is half the size.
  // So this should produce correct result we want.
  // -> eg. (5.5 * 2.0) => 11.0, which is in-between of pixel-centers 10.5 and 11.5
  vec2 coords = (gl_FragCoord.xy * 2.0) / FSH_SrcLayout;
  
    
  // Return the result.
  gl_FragColor = texture2D(gm_BaseTexture, coords);
}


//=============================================================
