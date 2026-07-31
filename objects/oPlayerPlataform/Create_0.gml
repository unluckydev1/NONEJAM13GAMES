
velh = 0;
velv = 0; 
velmax = 2;
jump_force = 6
gravida = .3

estado = "parado"
angle = 0
func_pular = function(){
    //Estou no chão
    var chao = instance_place(x,y + 1, oCollision)
    if(chao){
        
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
func_checa_chao = function(){
    if(!place_meeting(x,y + 1, oCollision)){
        estado = "caindo"
    }
}