//surface_resize(application_surface, 896, 504);

global.nodes = {
    fluxo1 : [],
    fluxo2 : []
}

global.liberados = {
    fluxo1 : [],
    fluxo2 : []
}

function skill_node(_spr, _nome, _x, _y, _img, _conect = [], _desc = "", _final) constructor
{
    _time  = 0;
    
    id = _nome;
    
    xs   = .5;
    ys   = .5;
    nxs  = 1;
    nys  = 1;
    ang  = 20;
    
    x   = _x;
    y   = _y;
    spr = _spr;
    
    apear = false;
    can   = false;
    
    final = _final;
    
    alp_b = 0;
    alp   = 0;
    
    info = {
        xsmax : 10, 
        ysmax : 4, 
        
        alp  : [0, 0],
        balp : [0, 0],
        xs   : 1,
        ys   : 1,
        nxs  : 10,
        nys  : 5,
        
        txt : _desc,
        
        img : _img,
        
        nivel : 0,
        
        addy : 0
    }
    
    offy = {
        r : 0,
        o : 0,
    };
    
    w = sprite_get_width(spr);
    h = sprite_get_height(spr);
    
    conects = _conect;
    linha = [];
    
    for (var i = 0; i < array_length(conects); i++) {
    	linha[i] = {
            x : x,
            y : y,
            
            alp_rainbow : 0,
            
            cores_corda    : [0, 0, 0],
            inicores_corda : [random_range(100, 300), random_range(100, 300), random_range(100, 300)]
        }
    }
}

function libera_node(_name, _nodes = global.nodes.fluxo1, _liberados = global.liberados.fluxo1){ 
    
    for (var i = 0; i < array_length(_nodes); i++) {
    	if (_nodes[i].id == _name and !array_contains(_liberados, _nodes[i])){
            array_push(_liberados, _nodes[i]);
          
            return i;
        }
    }
    
    return -1;
}

function puxa_tudo(setings = global.node_settings, _node = global.nodes.fluxo1, _libera = global.liberados.fluxo1)
{
    for (var i = 0; i < array_length(setings); i++) {
        var _ns = setings[i];
        
    	array_push(_node, new skill_node(_ns.sprite, _ns.title, _ns.cordx, _ns.cordy, _ns.imagem, _ns.conect, _ns.desc, _ns.final));
    }
}

#region Nodes Settings
global.node_names = {
    p1 : "Floresta",
	//Torre
    p2  : "Torre",
	
	p3 : "Porta",
	p4 : "Mago Mal",
	p5 : "Mago Bom",
	p6 : "Mago Sapo",
	
	p7 : "Janela",
	p8: "Escalada",
	p9: "Gritar",
	
	//Bosque
	p10: "Bosque",
	p11: "Luz estranha",
	p12: "Casa",
	
	p13: "Bater a porta",
	p14: "Entrar sem bater",

	// ===== Quarto da Princesa (fluxograma separado) =====

	// raízes
	q0  : "Quarto da Princesa", 
	q1  : "Príncipe vivo",
	q2  : "Príncipe não vivo",

	// -------- COM PRÍNCIPE --------
	q3  : "Quarto da Princesa (com príncipe)",
	q4  : "Abraçar",
	q5  : "Matar",
	q6  : "Porta (com príncipe)",
	q7  : "Mago (com príncipe)",
	q8  : "Mago Maligno (com príncipe)",
	q9  : "Mago Bom (com príncipe)",
	q10 : "Rei (com príncipe)",
	q11 : "Sapo (com príncipe)",

	// -------- SEM PRÍNCIPE --------
	q12 : "Quarto da Princesa (sem príncipe)",

	q13 : "Princesa pegou o lençol",
	q14 : "Janela do Quarto",   // <- antes era "Janela", colidia com p7
	q15 : "Escapou pelo lençol",
	q16 : "Morte na queda",

	q17 : "Esperar",
	q18 : "Cama",

	q19 : "Princesa pegou a chave",
	q20 : "Porta (sem príncipe)",
	q21 : "Porta trancada",

	q22 : "O que surgiu? (sem príncipe)",
	q23 : "Mago (sem príncipe)",
	q24 : "Mago Bom (sem príncipe)",
	q25 : "Mago Maligno (sem príncipe)",
	q26 : "Rei (sem príncipe)",
	q27 : "Sapo (sem príncipe)"
}

//Como nao da para pegar metade da tela, tenho que botar manualmente 
var _rm_width  = 640;
var _rm_height = 360;
var _db   = 100;
var _tree_gap = 900;   // <- distância horizontal entre os dois fluxogramas
var _names = global.node_names;

global.node_settings =
[
    // ===================================================
    // FLUXOGRAMA 1 - FLORESTA / TORRE / BOSQUE
    // ===================================================
    {
        sprite : spr_node,
        cordx  : _rm_width/2,
        cordy  : _rm_height/2,
        title  : _names.p1,
        conect : [_names.p2, _names.p10],
        desc   : "A nossa história começa em uma vasta floresta.",
        imagem: spr_nula,
        final  : false
	},
	
	// torre 
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db*2,
        cordy  : _rm_height/2 - _db*2,
        title  : _names.p2,
        conect : [_names.p3, _names.p7],
        desc   : "O Principe vai ate à torre.",
        imagem: spr_nula,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db*2 + _db*1.5,
        cordy  : _rm_height/2 - _db*2 - _db*1.5,
        title  : _names.p3,
        conect : [_names.p4, _names.p5, _names.p6],
        desc   : "O principe usa a porta.",
        imagem: spr_nula,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db*2 + _db*1.5 + _db,
        cordy  : _rm_height/2 - _db*2 - _db*1.5 + _db,
        title  : _names.p4,
        conect : [],
        desc   : "O principe morre pelo mago.",
        imagem: spr_nula,
        final: true,
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db*2 + _db*1.5 + _db,
        cordy  : _rm_height/2 - _db*2 - _db*1.5,
        title  : _names.p5,
        conect : [],
        desc   : "O principe sobe a torre com ajuda do mago.",
        imagem: spr_nula,
        final: true
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db*2 + _db*1.5 + _db,
        cordy  : _rm_height/2 - _db*2 - _db*1.5 -_db,
        title  : _names.p6,
        conect : [],
        desc   : "O principe é engolido pelo sapo.",
        imagem: spr_nula,
        final: true
	},

	// janela (opção alternativa à porta, saindo da Torre)
	{
        sprite : spr_node,
        cordx  : _rm_width/2 + _db*2 + _db*1.5,
        cordy  : _rm_height/2 - _db*2 + _db*1.5,
        title  : _names.p7,
        conect : [_names.p8, _names.p9],
        desc   : "O principe tenta a janela da torre.",
        imagem: spr_nula,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db*2 + _db*1.5 + _db,
        cordy  : _rm_height/2 - _db*2 + _db*1.5 - _db,
        title  : _names.p8,
        conect : [],
        desc   : "O principe tenta escalar e cai no ultimo tijolo, morrendo.",
        imagem: spr_nula,
        final: true
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 + _db*2 + _db*1.5 + _db,
        cordy  : _rm_height/2 - _db*2 + _db*1.5 + _db,
        title  : _names.p9,
        conect : [],
        desc   : "O principe grita, a princesa joga uma corda de lençóis.",
        imagem: spr_nula,
        final: false
	},

	// bosque (caminho da Escuridão)
	{
        sprite : spr_node,
        cordx  : _rm_width/2 - _db*2,
        cordy  : _rm_height/2 + _db*2,
        title  : _names.p10,
        conect : [_names.p11, _names.p12],
        desc   : "O principe segue pelo caminho escuro do bosque.",
        imagem: spr_nula,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 - _db*2 - _db*1.5,
        cordy  : _rm_height/2 + _db*2 + _db*1.5,
        title  : _names.p11,
        conect : [],
        desc   : "O principe se aproxima da luz e cai em uma armadilha de urso, morrendo.",
        imagem: spr_nula,
        final: true
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 - _db*2 - _db*1.5,
        cordy  : _rm_height/2 + _db*2 - _db*1.5,
        title  : _names.p12,
        conect : [_names.p13, _names.p14],
        desc   : "O principe encontra uma casa engraçada no bosque.",
        imagem: spr_nula,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 - _db*2 - _db*1.5 - _db,
        cordy  : _rm_height/2 + _db*2 - _db*1.5 - _db,
        title  : _names.p13,
        conect : [],
        desc   : "O principe bate na porta; o mago cogumelo teleporta ele ate à princesa.",
        imagem: spr_nula,
        final: false
	},
    {
        sprite : spr_node,
        cordx  : _rm_width/2 - _db*2 - _db*1.5 - _db,
        cordy  : _rm_height/2 + _db*2 - _db*1.5 + _db,
        title  : _names.p14,
        conect : [],
        desc   : "O principe entra sem bater e o mago bondoso, ofendido, o transforma em sapo.",
        imagem: spr_nula,
        final: true
	},
]
global.node_setting_princesa = 
[
    // ===================================================
    // FLUXOGRAMA 2 - QUARTO DA PRINCESA (deslocado por _tree_gap)
    // ===================================================

    // ---- raiz única ----
    {
        sprite : spr_node, cordx : 460 + _tree_gap, cordy : -60,
        title  : _names.q0,
        conect : [_names.q1, _names.q2],
        desc   : "A história chega ao quarto da princesa, no alto da torre.",
        imagem: spr_nula, final : false
    },

    // ---- raízes ----
    {
        sprite : spr_node, cordx : 250 + _tree_gap, cordy : 60,
        title  : _names.q1,
        conect : [_names.q3],
        desc   : "O príncipe conseguiu chegar até a torre.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 670 + _tree_gap, cordy : 60,
        title  : _names.q2,
        conect : [_names.q12],
        desc   : "O príncipe não sobreviveu para chegar até a torre.",
        imagem: spr_nula, final : false
    },

    // ---- com príncipe ----
    {
        sprite : spr_node, cordx : 250 + _tree_gap, cordy : 170,
        title  : _names.q3,
        conect : [_names.q4, _names.q5, _names.q6],
        desc   : "A princesa se questiona sobre o que fazer com seu salvador.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 90 + _tree_gap, cordy : 290,
        title  : _names.q4,
        conect : [],
        desc   : "A princesa abraça o príncipe e descem juntos da torre.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 250 + _tree_gap, cordy : 290,
        title  : _names.q5,
        conect : [],
        desc   : "A princesa confunde o príncipe com um caçador e o empurra da torre.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 410 + _tree_gap, cordy : 290,
        title  : _names.q6,
        conect : [_names.q7, _names.q10, _names.q11],
        desc   : "Os dois arrombam a porta do quarto e encontram algo do outro lado.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 270 + _tree_gap, cordy : 410,
        title  : _names.q7,
        conect : [_names.q8, _names.q9],
        desc   : "Um mago surge na frente dos dois.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 210 + _tree_gap, cordy : 530,
        title  : _names.q8,
        conect : [],
        desc   : "O mago maligno desintegra os dois com um raio.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 330 + _tree_gap, cordy : 530,
        title  : _names.q9,
        conect : [],
        desc   : "O mago bom os teletransporta de volta ao castelo.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 410 + _tree_gap, cordy : 410,
        title  : _names.q10,
        conect : [],
        desc   : "O rei, pai da princesa, surge e os leva para casa em segurança.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 550 + _tree_gap, cordy : 410,
        title  : _names.q11,
        conect : [],
        desc   : "Um sapo surge e suga o príncipe para dentro do estômago.",
        imagem: spr_nula, final : true
    },

    // ---- sem príncipe ----
    {
        sprite : spr_node, cordx : 670 + _tree_gap, cordy : 810,
        title  : _names.q12,
        conect : [_names.q14, _names.q17, _names.q18, _names.q20],
        desc   : "Sozinha na torre, a princesa se questiona sobre como sair dali.",
        imagem: spr_nula, final : false
    },

    // janela / lençol
    {
        sprite : spr_node, cordx : 350 + _tree_gap, cordy : 930,
        title  : _names.q14,
        conect : [_names.q16, _names.q13],
        desc   : "A princesa decide pular pela janela.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 290 + _tree_gap, cordy : 1050,
        title  : _names.q16,
        conect : [],
        desc   : "Ela não pensou em como amorteceria a queda.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 410 + _tree_gap, cordy : 1050,
        title  : _names.q13,
        conect : [_names.q15],
        desc   : "A princesa já havia pego o lençol de sua cama antes.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 410 + _tree_gap, cordy : 1170,
        title  : _names.q15,
        conect : [],
        desc   : "Usando o lençol como corda, ela consegue descer em segurança.",
        imagem: spr_nula, final : true
    },

    // esperar / cama
    {
        sprite : spr_node, cordx : 530 + _tree_gap, cordy : 930,
        title  : _names.q17,
        conect : [],
        desc   : "Ela espera pelo príncipe até virar apenas ossos.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 710 + _tree_gap, cordy : 930,
        title  : _names.q18,
        conect : [],
        desc   : "Ao procurar algo embaixo da cama, o bicho-papão a abocanha.",
        imagem: spr_nula, final : true
    },

    // porta / chave
    {
        sprite : spr_node, cordx : 890 + _tree_gap, cordy : 930,
        title  : _names.q20,
        conect : [_names.q21, _names.q19],
        desc   : "A princesa se aproxima da porta trancada de seu quarto.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 820 + _tree_gap, cordy : 1050,
        title  : _names.q21,
        conect : [],
        desc   : "A porta está trancada; frustrada, ela desiste de tentar qualquer coisa.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 960 + _tree_gap, cordy : 1050,
        title  : _names.q19,
        conect : [_names.q22],
        desc   : "A princesa já havia conseguido a chave da porta antes.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 960 + _tree_gap, cordy : 1170,
        title  : _names.q22,
        conect : [_names.q23, _names.q26, _names.q27],
        desc   : "Ela destranca e abre a porta, encontrando algo do outro lado.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 820 + _tree_gap, cordy : 1290,
        title  : _names.q23,
        conect : [_names.q24, _names.q25],
        desc   : "Um mago surge na sua frente.",
        imagem: spr_nula, final : false
    },
    {
        sprite : spr_node, cordx : 760 + _tree_gap, cordy : 1410,
        title  : _names.q24,
        conect : [],
        desc   : "O mago bom a resgata, resmungando da incompetência do príncipe.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 880 + _tree_gap, cordy : 1410,
        title  : _names.q25,
        conect : [],
        desc   : "O mago maligno a transforma em pó com seus poderes de raio.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 960 + _tree_gap, cordy : 1290,
        title  : _names.q26,
        conect : [],
        desc   : "O próprio rei surge e a leva para casa em segurança.",
        imagem: spr_nula, final : true
    },
    {
        sprite : spr_node, cordx : 1100 + _tree_gap, cordy : 1290,
        title  : _names.q27,
        conect : [],
        desc   : "Um sapo fofo surge, mas acaba engolindo a princesa.",
        imagem: spr_nula, final : true
    },
]
	//{
    //    sprite : spr_node,
    //    cordx  : _rm_width/2,
    //    cordy  : _rm_height/2 + _db*3,
    //    title  : _names.p15,
    //    conect : [],
    //    desc   : "O principe e a princesa finalmente se reencontram.",
    //    imagem: spr_nula,
    //    final: true
	//},

puxa_tudo();
puxa_tudo(global.node_setting_princesa, global.nodes.fluxo2, global.liberados.fluxo2);




