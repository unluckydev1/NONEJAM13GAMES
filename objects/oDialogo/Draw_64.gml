var accept_key = keyboard_check_pressed(vk_space)

var textbox_x = 64 
var textbox_y = guih - guih/4 - 32

if setup == false{
    setup = true
    draw_set_font(global.font_narrar)
    draw_set_valign(fa_top)
    
    page_number = array_length(text)
    
    for(var p = 0; p < page_number; p ++){
     
        
        text_length[p] = string_length(text[p].text)
        
    }
}

if draw_char < text_length[page]{
    var _lchar = draw_char
    draw_char += text_spd
    draw_char = clamp(draw_char, 0, text_length[page])
    
    /*if floor(_lchar) != floor(draw_char) and sfx_dialogo != noone {
        audio_play_sound(sfx_dialogo,1,0,.05,0,random_range(pitch_range, pitch_range + .04))
    }*/
}
if(contains){
	if	!(instance_exists(oEncaixe)){
		var inst = instance_create_depth(string_width_ext(str_encaixe, line_sep, line_width), textbox_y + bordery - 8,depth - 1,oEncaixe)
		inst.card = text[page].card
		inst.associado = text[page].npc
		
		global.card = text[page].card
	}else{
		oEncaixe.x =  string_width_ext(str_encaixe, line_sep, line_width)  
		global.card = oEncaixe.card
	}
}


if accept_key { 
	if draw_char == text_length[page]{
		
		
		
		if (page >= page_number - 1){
			if (text[page].func != -1){
				text[page].func()
			}
			global.reading = false
			instance_destroy()
			if instance_exists(oEncaixe) instance_destroy(oEncaixe) 
		}else{
			if (text[page].func != -1){
				text[page].func()
			}
			page ++;
			draw_char = 0;
			contains = false
			
			instance_destroy(oEncaixe)
			
		}
	}else if !string_pos("*",text[page].text){
		
		draw_char = text_length[page]
		
	}
}


txtb_img += txtb_img_spd;
var txtb_spr_w = 128;
var txtb_spr_h = 128;


draw_sprite_ext(txtb_spr, txtb_img,textbox_x, textbox_y, text_width/txtb_spr_w, text_height/txtb_spr_h, 0, c_white, 1)



var _drawtext = string_copy(text[page].text, 1, draw_char);
if string_pos("*",_drawtext){
	if string_ends_with(_drawtext,"*")	str_encaixe = _drawtext + "aaaaaaaa"
	_drawtext = string_replace(_drawtext,"*","                             ")
	//object_get_sprite(oEncaixe)*
	contains = true
	
}
var last_char = string_copy(_drawtext,string_length(_drawtext), 1);

switch(last_char){
    
    case ".":
        text_spd = .05
    break;
    case "?":
            text_spd = .05
        break;
    case "!":
            text_spd = .05
        break;
    
    case ",":
            text_spd = .075
    break;
    
    
    default: 
        text_spd = .5
        
}

draw_set_color(#190E01)
draw_set_halign(fa_left)

draw_text_ext(textbox_x + borderx, textbox_y + bordery, _drawtext, line_sep, line_width);

draw_set_halign(-1)
draw_set_color(c_white)


//if page >= 0 draw_text_ext_transformed(textbox_x + borderx, textbox_y + bordery - 64, text[page].speaker, 20, 20, 1.5, 1.5, 0)
