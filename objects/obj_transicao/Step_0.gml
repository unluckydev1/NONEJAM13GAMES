if (destino == noone){ 
    show_message("Destino deu noone"); 
    exit;
}

if (indo){
    if(toca){
        toca = false
        audio_play_sound(sfxTransVai, 0, 0)
    }
    img_ini += img_spd;
    
    if (img_ini - img_num > cols+30){
        if (room_exists(destino)){
            room_goto(destino);

            indo = false;
        }
    }
}else{
    
    img_ini -= img_spd;
                    if(!toca){
                toca = true
                audio_play_sound(sfxTransVai, 0, 0, 1, 0, .7)
            }
    if (img_ini <= -5){
        instance_destroy(self);
    }
}