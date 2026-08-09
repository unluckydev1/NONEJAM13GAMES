 pos1y = lerp(pos1y, valy, .1)
 pos2y = lerp(pos2y, valy, .09)
 pos3y = lerp(pos3y, valy, .08)
 pos4y = lerp(pos4y, valy, .07)
 pos5y = lerp(pos5y, valy, .06)

if(menu){
    valy = 0
    if(toquei){
        toquei = false 
        audio_play_sound(sfxPop,0, 0)
    }
}else{
    valy = 1800
    if(!toquei){
        toquei = true 
        audio_play_sound(sfxPop2,0, 0)
    }
}
