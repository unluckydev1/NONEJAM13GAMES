sprite = sprite_index;

y -= vspd;

vspd -= .08;

vspd = max(vspd, 0);

if (vspd <= 0){
    image_xscale = lerp(image_xscale, 0, .35);
    image_yscale = lerp(image_yscale, 2, .35);
    
    if (image_xscale <= 0){
        instance_destroy(self);
    }
}

alpha = lerp(alpha, 0, .15);