


/// Organização
if (!organized) {
	var _col = collision_circle(x, y, 64, oCarta, false, true);

	if (_col != noone) {
		x -= lengthdir_x(
			(64 - distance_to_object(_col)) * .075,
			point_direction(x, y, _col.x, _col.y)
		);
	} else {
		basex = x;
		organized = true;
	}
}

/// Desenho
var _multiplier = 3.5;
var hw = 16 * _multiplier;
var hh = 32 * _multiplier;

var left   = x - hw;
var top    = y - hh + yhover;
var right  = x + hw;
var bottom = y + hh + yhover;

draw_set_colour(card.color);
draw_rectangle(left, top, right, bottom, false);



draw_set_colour(c_black);
draw_rectangle(left, top, right, bottom, true);

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
depth = (hovering || pursue) ? -999 : dep_init;