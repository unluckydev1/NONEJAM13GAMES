

function start_act(){ 
    with(oCutscene){
        global.cutscene = true;
        end_act()
    }
}
function wait_in(time){
    timer += delta_time /  1000000;
    if (timer > time)
    {
        end_act();
    }
}
function cutscene_trigger(_cutscene){
    with(oCutscene){
    oCutscene.cutscene = global.cutscenes[_cutscene]
	show_debug_message("OI")
    }
}
function end_act(){
    with(oCutscene){
    start = false
    anim = -1
    timer = 0
    startx = 0
    starty = 0
    distx = 0
    disty = 0
    act_scene ++;
    }
}
function end_cutscene(){
    with(oCutscene){
        act_scene = 0
        cutscene = []
    }
    global.cutscene = false
}

function change_spr(obj,sprite, _index = -1){
    with(oCutscene){
        obj.sprite_index = sprite;
		if (_index > 0) obj.image_index = _index;
        end_act()
    }
}

function move_add(obj,_x,_y,time,curve_type = linearmove){
    with(oCutscene){
    if (!start)
    {
        startx = obj.x
        starty = obj.y
        distx = _x
        disty = _y
        anim = animcurve_get_channel(curve_type,0)
        timer = 0
        
        start = true
    }
    timer += delta_time /  1000000;
    var _pos = animcurve_channel_evaluate(anim, timer / time)
    
    obj.x = startx + distx*_pos
    obj.y = starty + disty*_pos
    show_debug_message(timer)
    
    if (timer > time)
    {
        end_act();
    }
    }    
}
function switch_npc(obj1,obj2){
	with(oCutscene){
		if instance_exists(obj1){
			var _x = obj1.x
			var _y = obj1.y
			var _layer = obj1.layer
			instance_destroy(obj1)
			instance_create_layer(_x,_y,_layer,obj2)
			end_act()
		}
	}
}
function move_to(obj,_x,_y,time,curve_type = linearmove){
    
    with(oCutscene){
    if (!start)
    {
        
        startx = obj.x
        starty = obj.y
        distx = _x - startx
        disty = _y - starty
        anim = animcurve_get_channel(curve_type,0)
        timer = 0
        
        start = true
    }
    timer += delta_time /  1000000;
    var _pos = animcurve_channel_evaluate(anim, timer / time)
    
    obj.x = startx + distx*_pos
    obj.y = starty + disty*_pos
    show_debug_message(timer)
    if (timer > time)
    {
        end_act();
    }
    }    
}
function new_dialogue(text){
    with(oCutscene){ 
       
    if (start == false){
        Create_dialogue(text)
        start = true 
    }
    if !instance_exists(oDialogo){
        end_act()
    }
    }
}

// ===============================
// CAPÍTULO 1 - A PRINCESA
// ===============================


// CAP1_FLORESTA_INICIO
Cutscene_Floresta_Inicio = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Floresta)},
    function(){end_cutscene()}
];


// CAP1_CAMINHO_TORRE
Cutscene_Caminho_Torre = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Torre)},
    function(){end_cutscene()}
];


// CAP1_CAMINHO_ESCURIDAO
Cutscene_Caminho_Escuridao = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Escuridao)},
    function(){end_cutscene()}
];


// CAP1_TORRE_PORTA
Cutscene_Torre_Porta = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Porta)},
    function(){end_cutscene()}
];


// CAP1_TORRE_JANELA
Cutscene_Torre_Janela = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Janela)},
    function(){end_cutscene()}
];


// CAP1_MAGO_MAL
Cutscene_Mago_Mal = [
    function(){start_act()},
    function(){new_dialogue(dialogo_Porta_MgMal)},
    function(){end_cutscene()}
];


// CAP1_MAGO_BOM
Cutscene_Mago_Bom = [
    function(){start_act()},
    function(){new_dialogue(dialogo_Porta_MgBom)},
    function(){end_cutscene()}
];

Cutscene_Mago_Sapo = [
    function(){start_act()},
    function(){new_dialogue(dialogo_Porta_MgSapo)},
    function(){end_cutscene()}
];



// CAP1_ESCALAR_TORRE
Cutscene_Escalar_Torre = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Cair)},
    function(){end_cutscene()}
];


// CAP1_GRITAR_PRINCESA
Cutscene_Gritar_Princesa = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Gritar)},
    function(){end_cutscene()}
];


// CAP1_LUZ_FLORESTA
Cutscene_Luz_Floresta = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Luz)},
    function(){end_cutscene()}
];


// CAP1_CASA_MAGO
Cutscene_Casa_Mago = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Casa)},
    function(){end_cutscene()}
];


// CAP1_ENTRAR_CASA
Cutscene_Entrar_Casa = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Abrir)},
    function(){end_cutscene()}
];


// CAP1_BATER_CASA
Cutscene_Bater_Casa = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Bater)},
    function(){end_cutscene()}
];
//======================================================
// CAPÍTULO 1 - PRINCESA
//======================================================

// CAP1_PRINCESA
Cutscene_Princesa = [
function(){start_act()},
function(){new_dialogue(Dialogo_Princesa)},
function(){end_cutscene()}
];

// CAP1_PRINCIPE
Cutscene_Principe = [
function(){start_act()},
function(){new_dialogue(Dialogo_Principe)},
function(){end_cutscene()}
];

// CAP1_PRINCESA_JANELA
Cutscene_Princesa_Janela = [
function(){start_act()},
function(){new_dialogue(Dialogo_Princesa_Janela)},
function(){end_cutscene()}
];

// CAP1_PRINCESA_ABRACAR
Cutscene_Princesa_Abracar = [
function(){start_act()},
function(){new_dialogue(Dialogo_Abracar)},
function(){end_cutscene()}
];

// CAP1_PRINCESA_MATAR
Cutscene_Princesa_Matar = [
function(){start_act()},
function(){new_dialogue(Dialogo_Matar)},
function(){end_cutscene()}
];

// CAP1_PRINCESA_PORTA
Cutscene_Princesa_Porta = [
function(){start_act()},
function(){new_dialogue(Dialogo_Princesa_Porta)},
function(){end_cutscene()}
];

// CAP1_PRINCESA_REI
Cutscene_Princesa_Rei = [
function(){start_act()},
function(){new_dialogue(Dialogo_PRei)},
function(){end_cutscene()}
];

// CAP1_PRINCESA_MAGO_BOM
Cutscene_Princesa_MgBom = [
function(){start_act()},
function(){new_dialogue(Dialogo_PMgBom)},
function(){end_cutscene()}
];

// CAP1_PRINCESA_MAGO_MAL
Cutscene_Princesa_MgMal = [
function(){start_act()},
function(){new_dialogue(Dialogo_PMgMal)},
function(){end_cutscene()}
];

// CAP1_PRINCESA_SAPO
Cutscene_Princesa_Sapo = [
function(){start_act()},
function(){new_dialogue(Dialogo_PSapo)},
function(){end_cutscene()}
];


global.cutscenes = [

    Cutscene_Floresta_Inicio,
    Cutscene_Caminho_Torre,
    Cutscene_Caminho_Escuridao,
    Cutscene_Torre_Porta,
    Cutscene_Torre_Janela,

    Cutscene_Mago_Mal,
    Cutscene_Mago_Bom,
	Cutscene_Mago_Sapo,

    Cutscene_Escalar_Torre,
    Cutscene_Gritar_Princesa,

    Cutscene_Luz_Floresta,
    Cutscene_Casa_Mago,

    Cutscene_Entrar_Casa,
    Cutscene_Bater_Casa,
	
	Cutscene_Princesa,
	
	Cutscene_Principe,
	Cutscene_Princesa_Janela,

	Cutscene_Princesa_Abracar,
	Cutscene_Princesa_Matar,
	Cutscene_Princesa_Porta,

	Cutscene_Princesa_Rei,
	Cutscene_Princesa_MgBom,
	Cutscene_Princesa_MgMal,
	Cutscene_Princesa_Sapo
];

enum CUTSCENE{
	
	CUT_FLORESTA,
	
	CUT_TORRE,
    CUT_ESCURIDAO,
	
	CUT_PORTA,
	CUT_JANELA,
	
	CUT_MGBOM,
	CUT_MGMAL,
	CUT_MGSAPO,
	
	CUT_ESCALAR,
	CUT_GRITAR,
	
	CUT_LUZ,
	CUT_CASA,
	
	CUT_ENTRAR,
	CUT_BATER,
	
	CUT_PRINCESA,

	CUT_PRINCIPE,
	CUT_PRINCESA_JANELA,

	CUT_PABRACAR,
	CUT_PMATAR,
	CUT_PPORTA,

	CUT_PREI,
	CUT_PMGBOM,
	CUT_PMGMAL,
	CUT_PSAPO
}