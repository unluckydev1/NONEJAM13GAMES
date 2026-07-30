var accept_key = keyboard_check_pressed(vk_space)

var textbox_x = 64
var textbox_y = guih - guih/4 - 32

if setup == false{
    setup = true
    draw_set_font(fnt_1)
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    
    page_number = array_length(text)
    
    for(var p = 0; p < page_number; p ++){
     
        
        text_length[p] = string_length(text[p].text)
        
        text_x_offset[p] = 0
        
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

if accept_key and (choosing == false){
    
    
    
    if draw_char == text_length[page]{
        
        /*if (text[page].newstart != undefined){ 
            father.textP = text[page].newstart - 1
            //show_message(text[page].newstart) 
        }*/
        if !(text[page].func == -1){
            text[page].func()
        }
        
        if !(variable_struct_exists(text[page],"choices")){
            var _next = text[page].next
            if (_next == -2){
                destroy()
            }else if (_next == -1){
                page += 1; draw_char = 0
            }else{
                page = _next
               
            }
            
        }else{
            page ++;
            draw_char = 0;
        }
        if (page > page_number -1){
            global.reading = false
            instance_destroy()
        }
    }else{
        draw_char = text_length[page]
    }
}


txtb_img += txtb_img_spd;
var txtb_spr_w = 128;
var txtb_spr_h = 128;


draw_sprite_ext(txtb_spr, txtb_img, textbox_x + text_x_offset[page], textbox_y, text_width/txtb_spr_w, text_height/txtb_spr_h, 0, c_white, 1)



var _drawtext = string_copy(text[page].text, 1, draw_char);

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

draw_text_ext(textbox_x + text_x_offset[page] + borderx, textbox_y + bordery, _drawtext, line_sep, line_width);
draw_set_color(c_white)
choosing = false
if draw_char = text_length[page]{
    if (variable_struct_exists(text[page],"choices")) {
        var len = array_length(text[page].choices) 
        var _arr = array_create(len)
        array_copy(_arr,0,text[page].choices,0,len)
        for(var i = 0; i < len; i ++){
            if _arr[i].show = false{
                array_delete(_arr,i,1)
            }
        }
        len = array_length(_arr)
        if keyboard_check_pressed(vk_up){
           selected ++;
        }
        if keyboard_check_pressed(vk_down){
           selected --;
        }   
        selected = clamp(selected,0,len - 1)    
        for(var i = 0; i < len; i ++){
            if (selected == i){
               draw_set_colour(c_yellow)
            }
            draw_text_ext(textbox_x + text_x_offset[page] + borderx, textbox_y + bordery - 96 - 30*i, _arr[i].text, 1000, 1000 )   
            show_debug_message(selected)
            draw_set_colour(c_white)
            }
            if keyboard_check_pressed(vk_enter){
                page = _arr[selected].next() - 1
                draw_char = 0
                choosing = false
                selected = 0
                if page < 0{
                    destroy()
                }
            }
        choosing = true 
        }
}


if page >= 0 draw_text_ext_transformed(textbox_x + text_x_offset[page] + borderx, textbox_y + bordery - 64, text[page].speaker, 20, 20, 1.5, 1.5, 0)

if portrait = true{
    var _x = textbox_x + text_width + 32
    var _y = textbox_y
    draw_sprite_ext(assigned_portrait,0,_x,_y,2.15,2.15,0,c_white,1)
}

