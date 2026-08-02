draw_set_colour(card.color)
draw_rectangle(x - 16, y - 24, x + 16, y + 24,false)
draw_set_colour(c_white)

if (mouse_check_button(mb_left)){
	if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),x - 16, y - 32, x + 16, y + 32)){
		pursue = true
	}
}
if pursue{
	x = device_mouse_x_to_gui(0)
	y = device_mouse_y_to_gui(0)
}
if mouse_check_button_released(mb_left){
	pursue = false
}