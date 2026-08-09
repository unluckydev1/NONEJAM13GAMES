display_set_gui_size(1366, 768);

if (object_get_parent(object_index) != -100) exit;

scribble_anim_wave(2,.1,.05);

var _txt = scribble(txt_title);

switch (title.states) {
	case "title":
        title.ny = string_height_scribble(txt_title)/title.ys[0];
    break;

    case "grande":
        title.ny = room_height/2;
    break;        
}

_txt.starting_format("fnt_menu2_sombra", "c_white");
_txt.align(1, 1);
_txt.transform(title.xs[0], title.ys[0], 0);
_txt.draw(title.x, title.y);

title.y = lerp(title.y, title.ny, .15);


draw_set_halign(fa_left);
draw_set_valign(1);

var _scale = 1.3;

var _str = string("[scale, {0}][wave]Aperte [scale,1.3][rainbow][scale, {1}]Enter[scale, {0}][/rainbow] para trilhar uma nova história!", _scale, click_enter)

draw_text_scribble(20, display_get_gui_height()-string_height_scribble(_str)*_scale, _str);

draw_set_halign(-1);
draw_set_valign(-1);

click_enter = lerp(click_enter, _scale, .15);