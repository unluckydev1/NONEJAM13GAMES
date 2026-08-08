depth = 9999;

//Quanto maior o numero, mais segue ;3
var p1 = 2
var p2 = 4
var p3 = 10
var p4 = 30

var _offx = -20;
var _offy = -20;

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

parallax_x = lerp(parallax_x, valx , .08);
parallax_y = lerp(parallax_y, valy , .08);

var _multi = 1.1;

//Nada
draw_sprite_tiled_ext(bg1, 0, _offx, _offy, _multi, _multi, c_white, 1);
//Pouco quase nada
draw_sprite_tiled_ext(bg2, 0, parallax_x * p1 + _offx, parallax_y * p1 + _offy, _multi, _multi, c_white, 1);
//Pouco
draw_sprite_tiled_ext(bg3, 0, parallax_x * p2 + _offx, parallax_y * p2 + _offy, _multi, _multi, c_white, 1);
//// Mais um pouco
//draw_sprite_tiled(bg4, 0, parallax_x * p3, parallax_y * p3)
//// Mais
//draw_sprite_tiled(bg5, 0, parallax_x * p4, parallax_y * p4)