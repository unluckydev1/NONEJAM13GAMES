if instance_exists(oCarta){
	var _carta = instance_nearest(x,y,oCarta)
	if point_in_circle(_carta.x,_carta.y,_x,_y,128){
		if _carta.pursue = false{
			card = _carta.card
			instance_destroy(_carta)
			global.card_in_mouse = -1
		}
	}
}
