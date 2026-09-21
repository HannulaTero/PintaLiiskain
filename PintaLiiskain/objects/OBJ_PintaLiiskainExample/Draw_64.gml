/// @desc DRAW INFO.

draw_text(16, 16, "Press [ Q, W, E, R, T, Y ] to select example input");
draw_text(16, 32, "Press [ A, S, D, F, G] to select Reducer");
draw_text(16, 48, "Use mouse to Zoom in");
draw_text(16, 80, $"Current : Example {self.strExample}, Reducer : {self.strReducer}");


if (device_mouse_check_button(0, mb_left) == true)
{
  var _w = 0.5 * room_width;
  var _h = 0.5 * room_height;
  draw_sprite(SPR_PintaLiiskainExample_Cursor, 0, _w, _h);
}