view_xport[0] = random_range(-shake, shake)
view_yport[0] = random_range(-shake, shake)
show_debug_message(shake)

if(shake <=0){
    instance_destroy()
    view_set_xport(view_xport[0], 0)
    view_set_yport(view_yport[0], 0)
}
else{
    shake *= subsub
    show_debug_message("esotu diminuindo o caralho games")
}
show_debug_message(shake)
    
