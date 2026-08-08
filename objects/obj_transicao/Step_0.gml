if (destino == noone){ 
    show_message("a"); 
    exit;
}

if (indo){
    img_ini += img_spd;
    
    if (img_ini - img_num > cols+30){
        if (room_exists(destino)){
            room_goto(destino);
            
            indo = false;
        }
    }
}else{
    img_ini -= img_spd;
    
    if (img_ini <= -5){
        instance_destroy(self);
    }
}