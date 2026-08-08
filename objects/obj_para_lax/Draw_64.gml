display_set_gui_size(1920, 1080)

var p1  = 0;
var p2  = 10;
var p3  = 20;
var p4  = 25;

var _offx = -60;
var _offy = -60;

var _camx = camera_get_view_x(view_camera[0])
var _camy = camera_get_view_y(view_camera[0])

var _cx = display_get_gui_width() * .5;
var _cy = display_get_gui_height() * .5;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var dx = _mx - _cx;
var dy = _my - _cy; 

dx /= _cx; 
dy /= _cy;

var valx = -dx * 2
var valy = -dy * 2

var _multi = 1.1;

//// Mais
draw_sprite_tiled_ext(bg5, 0, parallax_x * p4 + _offx, parallax_y * p4 + _offy, _multi, _multi, c_white, 1);