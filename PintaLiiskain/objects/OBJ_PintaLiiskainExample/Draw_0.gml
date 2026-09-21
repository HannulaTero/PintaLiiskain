/// @desc APPLY REDUCER.


self.liiskain.Verify();


if (keyboard_check(vk_anykey) == true)
{
  var _w = sprite_get_width(sprite_index);
  var _h = sprite_get_height(sprite_index);
  self.liiskain.SetLayout(_w, _h);
  self.liiskain.AssignSprite(sprite_index);
}


switch(keyboard_key)
{
  // Select sprite.
  case ord("Q"): self.strExample = "0"; sprite_index = SPR_PintaLiiskainExample_00; break;
  case ord("W"): self.strExample = "1"; sprite_index = SPR_PintaLiiskainExample_01; break;
  case ord("E"): self.strExample = "2"; sprite_index = SPR_PintaLiiskainExample_02; break;
  case ord("R"): self.strExample = "3"; sprite_index = SPR_PintaLiiskainExample_03; break;
  case ord("T"): self.strExample = "4"; sprite_index = SPR_PintaLiiskainExample_04; break;
  case ord("Y"): self.strExample = "5"; sprite_index = SPR_PintaLiiskainExample_05; break;
  
  // Select reducing method.
  case ord("A"): self.strReducer = "AVG"; self.liiskain.ReduceAvg(); break;
  case ord("S"): self.strReducer = "MAX"; self.liiskain.ReduceMax(); break;
  case ord("D"): self.strReducer = "MIN"; self.liiskain.ReduceMin(); break;
  case ord("F"): self.strReducer = "SUM"; self.liiskain.ReduceSum(); break;
  case ord("G"): self.strReducer = "UNORMSUM"; self.liiskain.ReduceUNormSum(); break;
}


// Visualize the output.
var _mapping = self.liiskain.GetMap();
if (_mapping != undefined)
{
  draw_surface(_mapping, self.x, self.y);
  surface_free(_mapping);
}
else
{
  draw_self();
}