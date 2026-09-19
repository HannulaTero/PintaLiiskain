

/**
* Returns a GPU state, which is good for ping-ponging, encoding etc.
*/ 
function __PintaLiiskainGPUState()
{
  static state = method_call(function() 
  {
    // Create a new GPU state.
    gpu_push_state();
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_alphatestenable(false);
    gpu_set_blendenable(false);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    gpu_set_zwriteenable(false);
    gpu_set_ztestenable(false);
    gpu_set_stencil_enable(false);
    gpu_set_tex_filter(false);
    gpu_set_tex_repeat(false);
    gpu_set_tex_mip_enable(false);
    gpu_set_fog(false, c_white, 1, 2);
    gpu_set_cullmode(cull_noculling);
    
    // Return the state.
    var _state = gpu_get_state();
    gpu_pop_state();
    return _state;
  });
  
  return state;
}