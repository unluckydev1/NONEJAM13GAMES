draw_set_alpha(alp)
alp = lerp(alp,1,.1)
scribble_font_set_default("fnt_1")

var accept_key = keyboard_check_pressed(vk_space)
text_to_draw = string(text[page].text)
show_debug_message(text_to_draw)
var textbox_x = 128
var textbox_y = guih - guih/4 
if (string_pos("*",text_to_draw)){

	assigned_portrait = noone
	textbox_y = 64
	
	for (var i = 1; i <= string_length(text_to_draw); i++)
	{
	    if (string_char_at(text_to_draw, i) == "*")
	    {
	        // Texto até o *
	        str_encaixe = string_copy(text_to_draw, 1, i);
			
	        // Calcula quantos espaços são necessários
	        largura_encaixe = sprite_get_width(sEncaixe) * (string_width("aaaaaaaa")/sprite_get_width(sEncaixe));
	        var largura_espaco = string_width(" ");
			show_debug_message(largura_encaixe)
	        var qtd_espacos = ceil(largura_encaixe / largura_espaco)
	        var espacos = "";
	        repeat (qtd_espacos + 1)
	        {
	            espacos += " ";
	        }
			show_debug_message(string_width(espacos))
	        // Substitui o * pelos espaços calculados
	        text_to_draw = string_replace(text_to_draw, "*", espacos);

	        contains = true;
	        break;
	    }
	}
}

if assigned_portrait != noone{
	draw_sprite_ext(text[page].portrait,0,0,guih + sqr(1 - alp)*55,.5,.55,0,c_white,alp)
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
		
		var _x = textbox_x + borderx + string_width(str_encaixe)
		var inst = instance_create_depth(_x, textbox_y + bordery - 8,depth - 1,oEncaixe)
		inst.x_base = _x

		var _pos = 0;
		var _spacing = 80;
		var _cards = [];
		
		for(var i = 0; i < CARD.HEIGHT; i++)
		{
			if(get_card(i).unlocked && array_contains(text[page].card,get_card(i).id))
			{
				array_push(_cards, get_card(i));
			}
		}


		var _start = guiw/2 - (array_length(_cards) - 1) * _spacing / 2;


		for(var i = 0; i < array_length(_cards); i++)
		{
			inst = instance_create_layer(x,y,layer,oCarta);
			
			inst.atraso -= 2*i
			
			inst.basex = _start + i * _spacing;
			inst.x = guiw/2 + i;

			inst.card = _cards[i];
			inst.dep_init += i;
		}
		
	}else{
		oEncaixe.x =  string_width_ext(str_encaixe, line_sep, line_width)  
		global.card = oEncaixe.card
	}
}


if accept_key { 
	if typist.get_state() = 1{//draw_char == text_length[page]{
		
		
		
		if (page >= page_number - 1) {
			
			repeat(1){
				if (contains and global.card == noone){
					break;
				}
				if (text[page].func != -1){
					text[page].func()
				}
				global.card = noone
				global.reading = false
				instance_destroy()
				if instance_exists(oEncaixe) instance_destroy(oEncaixe) 
				if instance_exists(oCarta) instance_destroy(oCarta) 
			}
		}else{
			repeat(1){
				if (contains and global.card == noone){
					break;
				}
				if (text[page].func != -1){
					text[page].func()
				}
				page ++;
				global.card = noone
				//draw_char = 0;
				contains = false
				if instance_exists(oEncaixe) instance_destroy(oEncaixe) 
				if instance_exists(oCarta) instance_destroy(oCarta) 
			}
		}
	}else{
		typist.skip_to_pause(1)
		
		
	}
}

var _mx = device_mouse_x_to_gui(0)
var _my = device_mouse_y_to_gui(0)
draw_sprite_ext(txtb_spr, txtb_img,textbox_x - 65,textbox_y - 50, 1.5,1, 0, c_white, alp)

draw_set_color(#423128)
draw_set_halign(fa_left)
scribble_font_set_default("fnt_1")
///Draw
var _text = string(text_to_draw)
scribble(_text).draw(textbox_x + borderx, textbox_y + bordery, typist);
scribble(_text).blend(draw_get_colour(),draw_get_alpha())
scribble(_text).wrap(900)
show_debug_message(_text)
//draw_text_ext(textbox_x + borderx, textbox_y + bordery, text_to_draw, line_sep, line_width);

draw_set_halign(-1)

draw_set_color(#423128)

var _scale =  100/string_width(text[page].speaker) + .1
draw_text_transformed(textbox_x + borderx + 5, textbox_y + bordery - 52,text[page].speaker,_scale,_scale,0)
//draw_circle(textbox_x + borderx + 10, textbox_y + bordery - 60,32,0)
draw_set_color(c_white)

draw_set_alpha(1)