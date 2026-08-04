var accept_key = keyboard_check_pressed(vk_space)
text_to_draw = string(text[page].text)
show_debug_message(text_to_draw)
var textbox_x = 64 
var textbox_y = guih - guih/4 - 32
if (string_pos("*",text_to_draw)){
	textbox_y = 32
	
	for (var i = 1; i <= string_length(text_to_draw); i++)
	{
	    if (string_char_at(text_to_draw, i) == "*")
	    {
	        // Texto até o *
	        str_encaixe = string_copy(text_to_draw, 1, i - 1) + "aaaaaaaa";

	        // Substitui o * por espaços
	        text_to_draw = string_replace(text_to_draw, "*", "                             ");

	        contains = true;
	        break;
	    }
	}
	
}




if setup == false{
    setup = true
    draw_set_font(global.font_narrar)
    draw_set_valign(fa_top)
    
    page_number = array_length(text)
    
    //for(var p = 0; p < page_number; p ++){
     
        
        //text_length[p] = string_length(text[p].text)
    
    //}
}

if(contains){
	if	!(instance_exists(oEncaixe)){
		var inst = instance_create_depth(string_width_ext(str_encaixe, line_sep, line_width), textbox_y + bordery - 8,depth - 1,oEncaixe)
		inst.card = text[page].card
		global.card = text[page].card

		for(var i = 0; i < CARD.HEIGHT; i ++){
			if (get_card(i).unlocked == true) and (get_card(i) != global.card){
				if (get_card(i).tipo = text[page].tipo){
					inst = instance_create_layer(x,y,layer,oCarta)
					inst.x = guiw/2 + i
					inst.card = get_card(i)
				}
			}
		}
		
	}else{
		oEncaixe.x =  string_width_ext(str_encaixe, line_sep, line_width)  
		global.card = oEncaixe.card
	}
}


if accept_key { 
	if typist.get_state() = 1{//draw_char == text_length[page]{
		
		
		
		if (page >= page_number - 1){
			if (text[page].func != -1){
				text[page].func()
			}
			global.reading = false
			instance_destroy()
			if instance_exists(oEncaixe) instance_destroy(oEncaixe) 
			if instance_exists(oCarta) instance_destroy(oCarta) 
		}else{
			if (text[page].func != -1){
				text[page].func()
			}
			page ++;
			//draw_char = 0;
			contains = false
			if instance_exists(oEncaixe) instance_destroy(oEncaixe) 
			if instance_exists(oCarta) instance_destroy(oCarta) 
			
		}
	}else{
		typist.skip_to_pause(1)
		
		
	}
}

var txtb_spr_w = sprite_get_width(spr_dialogo_box)
var txtb_spr_h = sprite_get_height(spr_dialogo_box)
draw_sprite_ext(txtb_spr, txtb_img,textbox_x, textbox_y, text_width/txtb_spr_w, text_height/txtb_spr_h, 0, c_white, 1)

draw_set_color(#190E01)
draw_set_halign(fa_left)
scribble_font_set_default("fnt_1")
///Draw
var _text = string(text_to_draw)
scribble(_text).draw(textbox_x + borderx, textbox_y + bordery, typist);
scribble(_text).blend(c_black,draw_get_alpha())

show_debug_message(_text)
//draw_text_ext(textbox_x + borderx, textbox_y + bordery, text_to_draw, line_sep, line_width);

draw_set_halign(-1)
draw_set_color(c_white)


txtb_img += txtb_img_spd;
var txtb_spr_w = 128;
var txtb_spr_h = 128;



//if page >= 0 draw_text_ext_transformed(textbox_x + borderx, textbox_y + bordery - 64, text[page].speaker, 20, 20, 1.5, 1.5, 0)