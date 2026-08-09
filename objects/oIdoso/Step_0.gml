if  !(start){
	destroi = false
	scalax = elastic("scalax", scalax, 1, 1, .1);
	if (abs(scalax - 1) < 0.001)
	{
		start = true
	}
	exit;
}
if (despawn){
	scalax = elastic("scalax", scalax, 0, 1, .1);
	if (alarm[0] <= 1)
	{
		instance_destroy()
		
	}
	exit;
}
switch(tipo){
    case "player":
        #region PLAYER
        destroi = false
        var left, right, up, down;
        
        left  = keyboard_check(ord("A"))
        up    = keyboard_check(ord("W")) 
        down  = keyboard_check(ord("S"))
        right = keyboard_check(ord("D"))
      /*  if(right xor left || down xor up){
            estado = "andando"
        }
        else{
            estado = "parado"
        }*/
        
        switch (estado) {
            case "parado":
                angle = lerp(angle, 0, .1)
                scalax = lerp(scalax, 1, .1);
                scalay = lerp(scalay, 1, .1);
            break;                                     
        
            case "andando":                       
                var ang = sin(acres_ang) * 10
                angle = lerp(angle, ang , .1)
                acres_ang += .05               
                scalay += (sin(acres_y) / 100) ;
                acres_y += .12                  
                scalax = (lerp(scalax, 1, .1)) ;
            break;                                     
        }     
    break; 
    #endregion
    case "item":
        destroi = true
        var ang = sin(acres_ang) * 10
        angle = lerp(angle, ang , .1)
        acres_ang += .05               
        scalay += (sin(acres_y) / 100) ;
        acres_y += .12                  
        scalax = (lerp(scalax, 1, .1)) ;
    break;
    case "mapa":
        destroi = false
        var ang = sin(acres_ang) * 5
        angle = lerp(angle, ang , .1)
        acres_ang += .02               
        scalay += (sin(acres_y) / 300) ;
        acres_y += .1                  
        scalax = (lerp(scalax, 1, .1)) ;
    break;
}

//efeito do mouse
scala_x_temp = lerp(scala_x_temp, 0, .1)
scala_y_temp = lerp(scala_y_temp, 0, .1)
show_debug_message(scalax)
show_debug_message(scalay)
show_debug_message(angle)

if(in){
    in_scale = lerp(in_scale, .2, .1)
}
else {
    in_scale = lerp(in_scale, 0, .1)
}
show_debug_message(in_scale)