//------// VIDA //------//

vidaAtual = 3;
dano      = 1;

invencibilidade = false; 
delayInvencibilidade = room_speed / 2;
timerInvencibilidade = delayInvencibilidade;

//------// MOVER //------//
velh = 0;
velv = 0; 
velmax = 2;
jump_force = 5
gravida = .3
//------// ESTADOS //------//

estado = "parado"
func_toma_dano = function(){
    var _tomei_dano = place_meeting(x,y,oDamage)
    if(_tomei_dano && invencibilidade == false){
        if(vidaAtual > 0)
        {
        vidaAtual -= dano
        invencibilidade = true
        timerInvencibilidade = delayInvencibilidade
        }
        else{
            estado = "morto"
        }
    }
    if(invencibilidade){
        
            image_alpha = .5
        if(timerInvencibilidade <= 0)
        {
            show_message("Saí")
            invencibilidade = false
            image_alpha = 1
        }
        else 
        {
            show_debug_message("Omaga, eu estou no caralhinho games")
            
        	timerInvencibilidade--
        }
    }
}
func_pular = function(){
    //Estou no chão
    if(place_meeting(x, y + 1, oCollision)){
        velv = 0 
        var _up = keyboard_check(vk_space);
        
        if(_up){
            estado = "pulando"
            velv = -jump_force
        }
    }
}
func_aplica_grav = function(){
    if(!place_meeting(x,y + 1, oCollision)){
        velv += gravida
    }
}