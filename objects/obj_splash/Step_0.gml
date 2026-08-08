if (image_alpha >= 0 and !toca){
    audio_play_sound(snd_splash, 0, 0, 2);
    
    toca = true;
}


if (vai = true){
    image_alpha -= .01;
    image_alpha = clamp(image_alpha, -infinity, 1);
    
    if (image_alpha <= 0){
        transicao_fade(rm_menu);
        
        instance_destroy();
    }
}else{
    image_alpha += .01;
    image_alpha = clamp(image_alpha, -infinity, 1);
    
    if (image_alpha >= 1){
        cooldown_games--;
        cooldown_games = clamp(cooldown_games, 0, infinity);
        
        if (cooldown_games <= 0){
            vai = true
        }
    }
}
