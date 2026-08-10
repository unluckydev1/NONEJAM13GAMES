function sScripts(){

}
function new_shake(_shake, _sub){
    var shakeshake = (!instance_exists(oScreenShake)) ? instance_create_depth(0,0, 0, oScreenShake) : oScreenShake.id;
    shakeshake.shake = _shake
    shakeshake.subsub = _sub
}

function reset_object(_obj){
    if (!instance_exists(_obj)) return;

    var _x = _obj.x;
    var _y = _obj.y;
    var _depth = _obj.depth;

    var _id = _obj.object_index;

    instance_destroy(_obj);

    instance_create_depth(_x, _y, _depth, _id);
}

function exclui_do_control(_val)
{
    if (instance_exists(obj_controla_itens)){
        with (obj_controla_itens) {
            var _valor = array_acha(itens, _val);
            
            if (_valor != -1) array_delete(itens, _valor, 1);
        }
    }else{
        show_message("Obj controla itens, nao existe :D");
    }
}

function cria_item(_spr, _x, _y, _depth = -16000){
    var _obj = instance_create_depth(_x, _y, _depth, obj_item);
    
    _obj.sprite_index = _spr;
}