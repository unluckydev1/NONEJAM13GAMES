draw_set_colour(c_black);
draw_set_alpha(.25);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
draw_set_colour(c_white);

draw_sprite_ext(spr_logo, 0, sprite_get_width(spr_logo)/2, sprite_get_height(spr_logo)+50+sin(current_time/1000)*10, .8, .8, 0, c_white, 1);