if (vai){
    image_alpha -= .025;
    image_alpha = clamp(image_alpha, 0, 2);
    
    if (image_alpha <= .01){
        instance_destroy();
    }
}else{
    image_alpha += .05;
    image_alpha = clamp(image_alpha, 0, 2);
    
    if (image_alpha >= 2){
        vai = true; 
        
        room_goto(destino);
    }
}