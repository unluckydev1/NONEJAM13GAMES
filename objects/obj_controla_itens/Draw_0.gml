addy = (array_length(itens)-1)*(64+30);

for (var i = 0; i < array_length(itens); i++) {
    //show_message(itens);
    
    var _n = itens[i][0];
    
    var _real_w = 64;
    var _real_h = 64;
    
    var _multi = _real_h/sprite_get_height(_n.spr);
    
    var _total = array_length(itens);
    var _t = (_total > 1) ? i / (_total - 1) : 0;
    
	draw_sprite_ext(_n.spr, 0, room_width-_real_w+sin((current_time/1000)*2 + (i/2*pi))*3, 50+raddy*(1-_t), _n.xs*_multi, _n.ys*_multi, _n.ang, c_white, _n.alp);
    
    _n.alp = lerp(_n.alp, 1, .15);
    _n.ang = elastic("ang" + string(i), _n.ang, 0, .75, .25);
    _n.xs = lerp(_n.xs, 1, .15);
    _n.ys = lerp(_n.ys, 1, .15);
}
 
raddy = lerp(raddy, addy, .1);