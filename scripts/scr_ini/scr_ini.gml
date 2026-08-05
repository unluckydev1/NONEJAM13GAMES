surface_resize(application_surface, 640, 360);

global.nodes = [];
global.liberados = [];

function libera_node(_name){
    for (var i = 0; i < array_length(global.nodes); i++) {
    	if (global.nodes[i].id == _name and !array_contains(global.liberados, global.nodes[i])){
            array_push(global.liberados, global.nodes[i]);
            
            return i;
        }
    }
    
    return -1;
}

#region Nodes Settings

global.node_names = {
    p1  : "InsaneV1",
    p2  : "InsaneV2",
    p3  : "InsaneV3",
    p4  : "InsaneV4",
    p5  : "InsaneV5",
    p6  : "InsaneV6",
    p7  : "InsaneV7",
    p8  : "InsaneV8",
    p9  : "InsaneV9",
    p10 : "InsaneV10",
}

//Como nao da para pegar metade da tela, tenho que botar manualmente 
var _rm_width = 640;
var _rm_height = 360;

var _names = global.node_names;

global.node_settings = 
[
    {
        sprite : spr_node,
        cordx  : _rm_width/2,
        cordy  : _rm_height/2,
        title  : _names.p1,
        conect : [_names.p2, _names.p4],
        desc   : "Batatoo do mds ce ta é louco ceu",
        imagem : spr_node,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+100,
        cordy  : _rm_height/2,
        title  : _names.p2,
        conect : [_names.p5],
        desc   : "Bata555to do 5565 555555 bom dia didi a diab seloco de dia bomom dsia ceu",
        imagem : spr_foto_placeholder,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+200,
        cordy  : _rm_height/2,
        title  : _names.p3,
        conect : [],
        desc   : "Batato do ceu",
        imagem : spr_foto_placeholder,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+100,
        cordy  : _rm_height/2-100,
        title  : _names.p4,
        conect : [_names.p3],
        desc   : "Batato do ceu",
        imagem : spr_foto_placeholder,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+200,
        cordy  : _rm_height/2+100,
        title  : _names.p5,
        conect : [_names.p6],
        desc   : "Batato do ceu",
        imagem : spr_foto_placeholder,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+300,
        cordy  : _rm_height/2+100,
        title  : _names.p6,
        conect : [_names.p7, _names.p8],
        desc   : "Batato do ceu",
        imagem : spr_foto_placeholder,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+300,
        cordy  : _rm_height/2,
        title  : _names.p7,
        conect : [],
        desc   : "Batato do ceu",
        imagem : spr_foto_placeholder,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+400,
        cordy  : _rm_height/2,
        title  : _names.p8,
        conect : [_names.p9],
        desc   : "Batato do ceu",
        imagem : spr_foto_placeholder,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+500,
        cordy  : _rm_height/2,
        title  : _names.p9,
        conect : [_names.p10],
        desc   : "Batato do ceu",
        imagem : spr_foto_placeholder,
        final  : false
    },
    
    {
        sprite : spr_node,
        cordx  : _rm_width/2+600,
        cordy  : _rm_height/2+100,
        title  : _names.p10,
        conect : [],
        desc   : "Batato do ceu",
        imagem : spr_foto_placeholder,
        final  : true
    },
]


#endregion

