//550 530
scale = lerp(scale,1,.15)
draw_set_font(global.font_narrar)
var _div = sprite_get_width(sEncaixe)
xscale = (string_width("aaaaaaaa")/_div )*scale
yscale = (string_height("a")/_div + 1) *scale


_x = x_base + sprite_get_width(sEncaixe)*xscale/2
_y = y + sprite_get_height(sEncaixe)*yscale/2


draw_sprite_ext(sEncaixe,0,_x,_y,xscale,yscale,0,c_white,1)

show_debug_message(sprite_get_width(sEncaixe)*xscale)
draw_set_colour(c_black)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)

if (card){
	draw_text_transformed(_x,_y,card.nome,scale,scale,0)
}
draw_set_valign(-1)
draw_set_halign(-1)
draw_set_colour(c_white)