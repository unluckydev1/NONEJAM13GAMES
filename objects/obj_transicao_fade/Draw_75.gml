display_set_gui_size(view_get_wport(view_camera[0]), view_get_hport(view_camera[0]));

draw_set_alpha(image_alpha);
draw_set_colour(c_black);
draw_rectangle(0, 0, view_get_wport(view_camera[0]), view_get_hport(view_camera[0]), false);
draw_set_colour(c_white);
draw_set_alpha(1);