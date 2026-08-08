function transicao(_destino)
{
    var _trans = instance_create_depth(0, 0, -9999, obj_transicao);
    
    _trans.destino = _destino;
}