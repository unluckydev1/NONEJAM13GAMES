

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
// ===============================
// CUTSCENES: QUARTO DA PRINCESA (COM PRÍNCIPE)
// ===============================

// QUARTO_PRINCESA_COMPRIN
Cutscene_Quarto_Princesa_ComPrincipe = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Princesa_ComPrincipe)},
    function(){end_cutscene()}
];

// QUARTO_ABRACAR
Cutscene_Quarto_Abracar = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Abracar)},
    function(){end_cutscene()}
];

// QUARTO_MATAR
Cutscene_Quarto_Matar = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Matar)},
    function(){end_cutscene()}
];

// QUARTO_PORTA_PR
Cutscene_Quarto_Porta_Pr = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Porta_Pr)},
    function(){end_cutscene()}
];

// QUARTO_MAGO_PR
Cutscene_Quarto_Mago_Pr = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Mago_Pr)},
    function(){end_cutscene()}
];

// QUARTO_MGMAL_PR
Cutscene_Quarto_MgMal_Pr = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_MgMal_Pr)},
    function(){end_cutscene()}
];

// QUARTO_MGBOM_PR
Cutscene_Quarto_MgBom_Pr = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_MgBom_Pr)},
    function(){end_cutscene()}
];

// QUARTO_REI_PR
Cutscene_Quarto_Rei_Pr = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Rei_Pr)},
    function(){end_cutscene()}
];

// QUARTO_SAPO_PR
Cutscene_Quarto_Sapo_Pr = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Sapo_Pr)},
    function(){end_cutscene()}
];


// ===============================
// CUTSCENES: QUARTO DA PRINCESA (SEM PRÍNCIPE)
// ===============================

// QUARTO_PRINCESA_SEMPRIN
Cutscene_Quarto_Princesa_SemPrincipe = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Princesa_SemPrincipe)},
    function(){end_cutscene()}
];

// QUARTO_JANELA
Cutscene_Quarto_Janela = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Janela)},
    function(){end_cutscene()}
];

// QUARTO_JANELA_MORTE
Cutscene_Quarto_Janela_Morte = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Janela_Morte)},
    function(){end_cutscene()}
];

// QUARTO_JANELA_LENCOL
Cutscene_Quarto_Janela_Lencol = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Janela_Lencol)},
    function(){end_cutscene()}
];

// QUARTO_ESPERAR
Cutscene_Quarto_Esperar = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Esperar)},
    function(){end_cutscene()}
];

// QUARTO_CAMA
Cutscene_Quarto_Cama = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Cama)},
    function(){end_cutscene()}
];

// QUARTO_PORTA_SO
Cutscene_Quarto_Porta_So = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Porta_So)},
    function(){end_cutscene()}
];

// QUARTO_PORTA_TRANCADA
Cutscene_Quarto_Porta_Trancada = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Porta_Trancada)},
    function(){end_cutscene()}
];

// QUARTO_PORTA_CHAVE
Cutscene_Quarto_Porta_Chave = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Porta_Chave)},
    function(){end_cutscene()}
];

// QUARTO_MAGO_SO
Cutscene_Quarto_Mago_So = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Mago_So)},
    function(){end_cutscene()}
];

// QUARTO_MGBOM_SO
Cutscene_Quarto_MgBom_So = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_MgBom_So)},
    function(){end_cutscene()}
];

// QUARTO_MGMAL_SO
Cutscene_Quarto_MgMal_So = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_MgMal_So)},
    function(){end_cutscene()}
];

// QUARTO_REI_SO
Cutscene_Quarto_Rei_So = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Rei_So)},
    function(){end_cutscene()}
];

// QUARTO_SAPO_SO
Cutscene_Quarto_Sapo_So = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Sapo_So)},
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
	// --- QUARTO DA PRINCESA (COM PRÍNCIPE) ---
    Cutscene_Quarto_Princesa_ComPrincipe,
    Cutscene_Quarto_Abracar,
    Cutscene_Quarto_Matar,
    Cutscene_Quarto_Porta_Pr,
    Cutscene_Quarto_Mago_Pr,
    Cutscene_Quarto_MgMal_Pr,
    Cutscene_Quarto_MgBom_Pr,
    Cutscene_Quarto_Rei_Pr,
    Cutscene_Quarto_Sapo_Pr,
    
    // --- QUARTO DA PRINCESA (SEM PRÍNCIPE) ---
    Cutscene_Quarto_Princesa_SemPrincipe,
    Cutscene_Quarto_Janela,
    Cutscene_Quarto_Janela_Morte,
    Cutscene_Quarto_Janela_Lencol,
    Cutscene_Quarto_Esperar,
    Cutscene_Quarto_Cama,
    Cutscene_Quarto_Porta_So,
    Cutscene_Quarto_Porta_Trancada,
    Cutscene_Quarto_Porta_Chave,
    Cutscene_Quarto_Mago_So,
    Cutscene_Quarto_MgBom_So,
    Cutscene_Quarto_MgMal_So,
    Cutscene_Quarto_Rei_So,
    Cutscene_Quarto_Sapo_So
	
	
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
	
	CUT_QUARTO_PRINCESA_COMPRIN,
    CUT_QUARTO_ABRACAR,
    CUT_QUARTO_MATAR,
    CUT_QUARTO_PORTA_PR,
    CUT_QUARTO_MAGO_PR,
    CUT_QUARTO_MGMAL_PR,
    CUT_QUARTO_MGBOM_PR,
    CUT_QUARTO_REI_PR,
    CUT_QUARTO_SAPO_PR,
    
    // Rotas SEM Príncipe
    CUT_QUARTO_PRINCESA_SEMPRIN,
    CUT_QUARTO_JANELA,
    CUT_QUARTO_JANELA_MORTE,
    CUT_QUARTO_JANELA_LENCOL,
    CUT_QUARTO_ESPERAR,
    CUT_QUARTO_CAMA,
    CUT_QUARTO_PORTA_SO,
    CUT_QUARTO_PORTA_TRANCADA,
    CUT_QUARTO_PORTA_CHAVE,
    CUT_QUARTO_MAGO_SO,
    CUT_QUARTO_MGBOM_SO,
    CUT_QUARTO_MGMAL_SO,
    CUT_QUARTO_REI_SO,
    CUT_QUARTO_SAPO_SO
}