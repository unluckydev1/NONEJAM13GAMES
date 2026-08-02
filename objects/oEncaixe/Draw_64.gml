//550 530
scale = lerp(scale,1,.15)
draw_set_font(global.font_narrar)
var _div = sprite_get_width(sEncaixe)
xscale = (string_width("aaaaaaaaaaa")/_div + .5)
yscale = (string_height("a")/_div + 1) *scale
draw_sprite_ext(sEncaixe,0,x,y,xscale,yscale,0,c_white,1)

_x = x + sprite_get_width(sEncaixe)*xscale/2
_y = y + sprite_get_height(sEncaixe)*yscale/2

draw_set_colour(c_black)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)

draw_text_transformed(_x,_y,card.nome,1,scale,0)

draw_set_valign(-1)
draw_set_halign(-1)
draw_set_colour(c_white)