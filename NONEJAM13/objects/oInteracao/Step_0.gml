if(collision_circle(x,y, radius, oPlayerTopDown, 1, 1)){
    image_blend = c_yellow
    if(keyboard_check_pressed(ord("F"))){
        new_shake(50, .92)
    }
}
else{
    image_blend = c_white
}