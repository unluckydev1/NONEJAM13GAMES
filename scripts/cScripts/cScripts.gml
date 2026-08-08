function sScripts(){

}
function new_shake(_shake, _sub){
    var shakeshake = instance_create_layer(0,0, "Efeitos", oScreenShake)
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