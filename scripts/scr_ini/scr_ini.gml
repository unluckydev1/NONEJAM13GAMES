//surface_resize(application_surface, 896, 504);

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
    p1 : "Floresta",
	//Torre
    p2  : "Torre",
	
	p3 : "Porta",
	p4 : "Mago Mal",
	p5 : "Mago Bom",
	p6 : "Mago Sapo"
	/*
	p21 : "Janela",
	p210: "Escalada",
	p211: "Gritar",
	
	//Bosque
	p3: "Bosque",
	p30: "Luz estranha",
	p31: "Casa",
	
	p310: "Bater a porta",
	p311: "Entrar sem bater",
	
	//Princesa
	
	p4: "Quarto da Princesa"*/
}

//Como nao da para pegar metade da tela, tenho que botar manualmente 
var _rm_width = 640;
var _rm_height = 360;


var _db = 100
var _names = global.node_names;

global.node_settings =
[
    {
        sprite : spr_node,
        cordx  : _rm_width/2,
        cordy  : _rm_height/2,
        title  : _names.p1,
        conect : [_names.p2],//_names.p3],
        desc   : "A nossa história começa em uma vasta floresta.",
        imagem : spr_node,
        final  : false
	},
	
	// torre 
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db,
        cordy  : _rm_height/2 - _db,
        title  : _names.p2,
        conect : [_names.p3],//, _names.p21],
        desc   : "O Principe vai ate à torre.",
        imagem : spr_node,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db,
        cordy  : _rm_height/2 + _db,
        title  : _names.p3,
        conect : [_names.p4, _names.p5, _names.p6],
        desc   : "O principe usa a porta.",
        imagem : spr_node,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db + _db,
        cordy  : _rm_height/2 + _db - _db,
        title  : _names.p4,
        conect : [],
        desc   : "O principe morre pelo mago.",
        imagem : spr_node,
        final: false,
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2  + _db + _db,
        cordy  : _rm_height/2  + _db,
        title  : _names.p5,
        conect : [],
        desc   : "O principe sobe a torre com ajuda do mago.",
        imagem : spr_node,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2  + _db + _db,
        cordy  : _rm_height/2  + _db  + _db,
        title  : _names.p6,
        conect : [],
        desc   : "O principe é engolido pelo sapo.",
        imagem : spr_node,
        final: false
	},
]


#endregion

