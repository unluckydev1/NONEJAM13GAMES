display_set_gui_size(1366, 768);

if (object_get_parent(object_index) != -100) exit;

scribble_anim_wave(2,.1,.1);

var _txt  = scribble(txt_title);
var _txtr = scribble(txt_rtitle);

switch (title.states) {
	case "title":
        title.y = string_height_scribble(txt_title)*3;
        
        title.xs[1] = .4;
        title.ys[1] = .4;
    break;

    case "grande":
        title.y = room_height/2;
        
        title.xs[1] = 1;
        title.ys[1] = 1;
        
        title.alp_r = 1;
        
        title.cooldown_passa--;
        title.cooldown_passa = clamp(title.cooldown_passa, 0, infinity);
        
        if (title.cooldown_passa <= 0){
            title.states = "sai";
        }
    break;       

    case "sai":
        title.ny = string_height_scribble(txt_title)*3;      
        
        title.y -= title.vspd;
        title.ys[0] += title.vspd/500;
        
        title.vspd += .4;
        
        title.xs[1] = .4;
        title.ys[1] = .4;
        
        if (title.y <= title.ny){
            title.xs[1] = .4;
            title.ys[1] = .4;
            title.xs[0] = .8;
            title.ys[0] = .3;
            
            title.y = title.ny;
            
            title.vspd = 0;
            title.states = "title";
        }        
    break;
}

_txt.starting_format("fnt_menu2_sombra", "c_white");
_txt.align(1, 1);
_txt.blend(c_white, 1 - title.alp_r);
_txt.transform(title.xs[0], title.ys[0], 0);
_txt.draw(title.x, title.y);

_txtr.starting_format("fnt_menu2_sombra", "c_white");
_txtr.align(1, 1);
_txtr.blend(c_white, title.alp_r);
_txtr.transform(title.xs[0], title.ys[0], 0);
_txtr.draw(title.x, title.y);

title.xs[0] = lerp(title.xs[0], title.xs[1], .1);
title.ys[0] = lerp(title.ys[0], title.ys[1], .1);
title.alp_r = lerp(title.alp_r, 0, .1);


draw_set_halign(fa_left);
draw_set_valign(1);

var _scale = 1.3;

var _str = string("[scale, {0}][wave]Aperte [scale,1.3][rainbow][scale, {1}]Enter[scale, {0}][/rainbow] para trilhar uma nova história!", _scale, click_enter)

draw_text_scribble(20, display_get_gui_height()-string_height_scribble(_str)*_scale, _str);

draw_set_halign(-1);
draw_set_valign(-1);

click_enter = lerp(click_enter, _scale, .15);