xscale = [1, 1];
yscale = [1, 1];
alp_b  = 0;
angle  = 0;

entra = false;

multi = 1;

sprite_index = sprite;

action = noone;

desenha = function()
{
    image_xscale = multi;
    image_yscale = multi;
    
    draw_sprite_ext(sprite_index, 0, x+sin((current_time/1000)*2 + (num*5))*2, y, xscale[0]*multi, yscale[0]*multi, angle, c_white, 1);
    
    shader_set(sh_multi_color);
    draw_sprite_ext(sprite_index, 0, x, y, xscale[0]*multi, yscale[0]*multi, angle, c_white, alp_b);
    shader_reset();
    
    xscale[0] = elastic("xscale11", xscale[0], xscale[1], 1, .2);
    yscale[0] = elastic("yscale11", yscale[0], yscale[1], 1, .2);
    
    angle = elastic("angle", angle, 0, 1, .15);
    
    alp_b = lerp(alp_b, 0, .15);
}

mouse_cima = function()
{
    if (instance_exists(obj_transicao)) exit;
    
    if (position_meeting(mouse_x, mouse_y, id)){
        if (!entra){
            xscale[0] = 1.1;
            yscale[0] = .9;
        }
        
        if (mouse_check_button(mb_left)){
            xscale[1] = 1.1;
            yscale[1] = 1.1;
        }
        
        if (mouse_check_button_released(mb_left)){
            xscale[1] = 1;
            yscale[1] = 1;
            
            angle = choose(-25, 25);
            
            if (action == noone){
                transicao(local);
				audio_play_sound(snd_start, 0, 0, 2);
				audio_stop_sound(snd_menu_jogo)
            }else{
                if (is_callable(action)) action(); //Ta dando erro mas ta certo
            }
                
            alp_b = 2;
        }
        
        entra = true;
    }else{
        entra = false;
        
        xscale[1] = 1;
        yscale[1] = 1;
    }
}