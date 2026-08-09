speed *= sub_vel

if(alpha <=0) instance_destroy()
else{
    alpha -= sub_alpha
    alpha_estrela -= sub_alpha
}
image_angle += acres_ang
image_alpha = alpha