randomise();

var _spr = sprite

if (instance_exists(obj_controla_itens)){
    with (obj_controla_itens) {
    	array_push(itens, [{spr : _spr, xs : 1.2, ys : .5, ang : choose(-20, 20), alp : 0}, object_index, _spr]);
    }
}