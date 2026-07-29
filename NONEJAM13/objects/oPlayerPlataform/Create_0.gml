
velh = 0;
velv = 0; 
velmax = 2;
jump_force = 5
gravida = .3

estado = "parado"

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