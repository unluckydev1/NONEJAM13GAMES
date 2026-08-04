if instance_exists(oCarta){
	var _carta = instance_nearest(x,y,oCarta)
	if point_in_rectangle(_carta.x,_carta.y, x,y,x + sprite_get_width(sEncaixe)*xscale, y + sprite_get_height(sEncaixe)*yscale){
		if _carta.pursue = false{
			card = _carta.card
			instance_destroy(_carta)
			global.card_in_mouse = -1
		}
	}
}
