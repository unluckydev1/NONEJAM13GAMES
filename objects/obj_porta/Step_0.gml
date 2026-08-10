if (last_spr != sprite_index){
    image_xscale = 1.3;
    image_yscale = .6;
}

last_spr = sprite_index;

image_xscale = lerp(image_xscale, 1, .15);
image_yscale = lerp(image_yscale, 1, .15);