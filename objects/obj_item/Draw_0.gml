draw_self();

apply_rainbow(sprite_index, _time, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha/3);
shader_reset();

_time += .05;

shader_set(sh_multi_color);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);
shader_reset();