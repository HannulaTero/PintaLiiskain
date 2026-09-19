/// @desc APPLY REDUCER.


self.liiskain.AssignSprite(SPR_PintaLiiskain_Example);

switch(keyboard_key)
{
  case ord("1"): self.liiskain.UpdateAvg(); break;
  case ord("2"): self.liiskain.UpdateMax(); break;
  case ord("3"): self.liiskain.UpdateMin(); break;
  case ord("4"): self.liiskain.UpdateSum(); break;
  case ord("5"): self.liiskain.UpdateUNormSum(); break;
}

self.x = 64;
self.y = 64;
array_foreach(self.liiskain.surfaces, function(_surface, _index)
{
  draw_surface(_surface, self.x, self.y)
  self.x += self.liiskain.layouts[_index][0] + 16;
});


var _mapping = self.liiskain.GetMap();
draw_surface(_mapping, self.x, self.y);
surface_free(_mapping);