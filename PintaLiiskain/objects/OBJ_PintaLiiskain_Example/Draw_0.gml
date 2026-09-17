/// @desc APPLY REDUCER.


self.liiskain.AssignSprite(SPR_PintaLiiskain_Example);
self.liiskain.Update(SHD_PintaLiiskain_Max); 


self.x = 256;
array_foreach(self.liiskain.surfaces, function(_surface, _index)
{
  draw_surface(_surface, self.x, self.y)
  self.x += self.liiskain.layouts[_index][0] + 16;
});