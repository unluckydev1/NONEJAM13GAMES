/// Organização elástica
if (!organized){
	_force = (basex - x) * 0.08;
	xspd *= 0.85;
	xspd += _force;

	x += xspd;

	if (abs(basex - x) < 1 && abs(xspd) < 1)
	{
	    x = basex;
	    xspd = 0;
		organized = true
	}
}
/// Desenho
var _multiplier = 3.5;
var hw = 16 * _multiplier;
var hh = 32 * _multiplier;

ysin = sin(get_timer()/100005 + atraso)*2

var left   = x - hw;
var top    = y - hh + yhover + ysin;
var right  = x + hw;
var bottom = y + hh + yhover + ysin;

var _scale = .25;

var _x, _y, _backw, _backh, _backxs, _backys, _w, _h, _add;

_w = sprite_get_width(card.sprite)*_scale;
_h = sprite_get_height(card.sprite)*_scale;

_x = x;
_y = y + yhover + ysin;

_add = 6;

_backw = sprite_get_width(spr_player);
_backh = sprite_get_height(spr_player);

_backxs = (_w+_add)/_backw;
_backys = (_h+_add)/_backw;

//draw_set_colour(card.color);
shader_set(sh_multi_color);
if (outrainbow) apply_rainbow(spr_player, _time, 0);
draw_sprite_ext(spr_player, 0, _x, _y, _backxs, _backys, 0, c_black, 1);
shader_reset();
draw_sprite_ext(card.sprite,0,_x,_y,_scale,_scale,0,c_white,1)
//draw_rectangle(left, top, right, bottom, false);

draw_set_colour(c_white);

draw_text(x,y + yhover - 60,card.nome)

// Destroi se a carta ja tiver sido selecionada

if (global.card_in_mouse == -1){
	y += 5
	if y > guih + 200 instance_destroy()
	exit;
	

}

/// Animação de entrada
if (subindo > 1) {
	y = guih + subindo;
	subindo = lerp(subindo, 0, .2);
}

/// Espera terminar a organização
if (!organized) exit;


/// Mouse
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var hovering = point_in_rectangle(
	mx, my,
	x - hw, y - hh,
	x + hw, y + hh
);


/// Hover
if (hovering) {

	if (global.card_in_mouse == noone)
		global.card_in_mouse = id;

	if (global.card_in_mouse == id) {

		yhover = mouse_check_button(mb_left)
			? 0
			: lerp(yhover, -50, .2);

		if (mouse_check_button(mb_left))
			pursue = true;
	}

} else {

	yhover = lerp(yhover, 0, .2);

	if (global.card_in_mouse == id && !pursue)
		global.card_in_mouse = noone;
}


/// Movimento
if (pursue) {
	var _x = x
	var _y = y
	x = lerp(x, mx, .3);
	y = lerp(y, my, .3);


	if (mouse_check_button_released(mb_left))
		pursue = false;

} else {

	x = lerp(x, basex, .2);
	y = lerp(y, guih, .2);
}


/// Depth
depth = ((hovering || pursue)&&global.card_in_mouse == id) ? -9999 : dep_init;