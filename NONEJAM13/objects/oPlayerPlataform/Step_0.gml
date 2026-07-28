var _left, _right, _up, _down;

_left   = keyboard_check(ord("A"));
_right  = keyboard_check(ord("D"));
_up     = keyboard_check(vk_space);


velh = (_right - _left) * velmax



switch(estado){
    case "parado":
        sprite_index = spr_player
        velh = 0 
        
        if(_left || _right){
            estado = "andando"
        }
        func_pular()
        
    break;
    
    case "andando":
        if(velh > 0)sprite_index = sPlayerI5
        if(velh < 0)sprite_index = sPlayerI1
        if(velh == 0 && velv == 0){
            estado = "parado"
        }
        func_pular()
    break; 

    case "pulando":
        sprite_index = sPlayerI3
        if(velv >= 0) estado = "caindo"
    break; 

    case "caindo":
        sprite_index = sPlayerI7
        if(place_meeting(x, y + 1, oCollision)){
            estado = "parado"
        }
    break;
}

func_aplica_grav()
show_debug_message("velv: " + string(velv))
move_and_collide(velh, 0, oCollision, 4)
move_and_collide(0, velv, oCollision, 4)
show_debug_message(estado)