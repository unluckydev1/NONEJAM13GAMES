scribble_font_bake_shadow("fnt_menu2", "fnt_menu2_sombra", 0, 8, c_black, 1, 3, false);

function transicao(_destino)
{
    var _trans = instance_create_depth(0, 0, -9999, obj_transicao);
    
    _trans.destino = _destino;
}

function transicao_fade(_destino)
{
    var _trans = instance_create_depth(0, 0, -9999, obj_transicao_fade);
    
    _trans.destino = _destino;
}