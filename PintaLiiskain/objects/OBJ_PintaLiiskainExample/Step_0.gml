/// @desc CHANGE CAMERA.


var _camera = view_camera[0];
var _x = 0;
var _y = 0;
var _w = room_width;
var _h = room_height;
if (device_mouse_check_button(0, mb_left) == true)
{
  _w *= 0.25;
  _h *= 0.25;
  _x = device_mouse_x_to_gui(0) - _w * 0.5;
  _y = device_mouse_y_to_gui(0) - _h * 0.5;
}
camera_set_view_size(_camera, _w, _h);
camera_set_view_pos(_camera, _x, _y);