

/**
* Assign the given sprite as initial source.
* This is stretched to cover the whole area.
* 
* @context PintaLiiskain
* @param {Asset.GMSprite} _sprite
* @param {Real}           _image
* @returns {Struct.PintaLiiskain}
*/ 
function __PintaLiiskain__AssignSprite(_sprite, _image=0)
{
  // Preparations.
  self.Verify();
  var _count = array_length(self.surfaces);
  if (_count <= 0)
  {
    return;
  }
  
  
  // Apply the sprite.
  gpu_push_state();
  gpu_set_tex_filter(false);
  gpu_set_blendenable(false);
  surface_set_target(self.surfaces[0]);
  draw_sprite_stretched(_sprite, _image, 0, 0, self.maxLayout[0], self.maxLayout[1]);
  surface_reset_target();
  gpu_pop_state();
}