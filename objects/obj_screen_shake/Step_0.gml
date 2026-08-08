randomize();

if (treme > .01){
    if (instance_exists(obj_fluxograma_pai)){
        obj_fluxograma_pai.shake[0] = random_range(-treme, treme);
        obj_fluxograma_pai.shake[1] = random_range(-treme, treme);
    }
    
    treme = lerp(treme, 0, .1);
}else{
    treme = 0;
}