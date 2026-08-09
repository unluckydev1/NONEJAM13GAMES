
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var _multiplier = 3.5;
var hw = 16 * _multiplier;
var hh = 32 * _multiplier;

var hovering = point_in_rectangle(
	mx, my,
	x - hw, y - hh,
	x + hw, y + hh
);

if (global.card_in_mouse == -1 or !hovering) exit;

new_shake(2, .9);

repeat (20) {
	var _part = instance_create_depth(x,y, -1000, oParticle_gui);
    
    _part.image_blend = c_orange;
}
audio_play_sound(sfxImpactoCarta1,0, 0)
audio_play_sound(sfxImpactoCarta2,0, 0, 2)