function particle_create(obj){
	repeat (20) {
		instance_create_layer(obj.x,obj.y - 32, "Particulas", oParticle)
	}
	end_act()
}
function cutscene_trigger(_cutscene){
    with(oCutscene){
    oCutscene.cutscene = global.cutscenes[_cutscene]
    }
}
function play_cutscene_sound(index,priority,loop,gain,offset, pitch = 1){
    with(oCutscene){
         if !start {audio_play_sound(index,priority,loop,gain,offset, pitch); start = true}
         end_act()
    }
}
function start_act(){ 
    with(oCutscene){
        global.cutscene = true;
        end_act()
    }
}
function wait_in(time){
	with(oCutscene){
    timer += delta_time /  1000000;
    if (timer > time)
    {
        end_act();
    }
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
	var _par = false
	if keyboard_check_pressed(vk_space){
		timer = time
		_par = true
	}
    timer += delta_time /  1000000;
    var _pos = animcurve_channel_evaluate(anim, timer / time)
    
    obj.x = startx + distx*_pos
    obj.y = starty + disty*_pos
    show_debug_message(timer)
    if (_par) particle_create(obj)
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
	var _par = false
	if keyboard_check_pressed(vk_space){
		timer = time
		_par = true
	}
    timer += delta_time /  1000000;
    var _pos = animcurve_channel_evaluate(anim, timer / time)
    
    obj.x = startx + distx*_pos
    obj.y = starty + disty*_pos
	if (_par) particle_create(obj)
    show_debug_message(timer)
    if (timer > time)
    {
        end_act();
    }
    }    
}function move_to_speed(obj, _x, _y, _speed, curve_type = linearmove){
    
    with(oCutscene){
    if (!start)
    {
        startx = obj.x
        starty = obj.y
        distx = _x - startx
        disty = _y - starty
        
        var _dist = point_distance(startx, starty, _x, _y)
        dur = _dist / _speed
        
        anim = animcurve_get_channel(curve_type, 0)
        timer = 0
        tick_anterior = 0   // <-- controle dos "quartos de segundo"
        start = true
    }
    
    var _par = false
    if keyboard_check_pressed(vk_space){
        timer = dur
        _par = true
    }
    timer += delta_time / 1000000
    
    var _pos = animcurve_channel_evaluate(anim, timer / dur)
    
    // checa se passou por mais um intervalo de 1/4 de segundo
    var _intervalo = 0.25
    var _tick_atual = floor(timer / _intervalo)
    if (_tick_atual != tick_anterior)
    {   
        pitch = random_range(0.9, 1)
        passo_atual = choose(sfxPasso2, sfxPasso3, sfxPasso4, sfxPasso5)
        tick_anterior = _tick_atual
        instance_create_depth(obj.x, obj.y, obj.depth, oPum)
        audio_play_sound(passo_atual, 0, 0, 1, 0, pitch)
    }
    
    obj.x = startx + distx * _pos
    obj.y = starty + disty * _pos
    if (_par) particle_create(obj)
    if (timer > dur)
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
    if !global.reading{
        end_act()
    }
    }
}
function room_change(_room){
	with(oCutscene){
		if start = false{transicao(_room); start = true}
		if (room = _room){
			timer += delta_time / 1000000
			if timer > 2 end_act()
			
		}
	}
}

function npc_spawn(obj, _x, _y, _start = true){
	var inst = instance_create_layer(_x,_y,"Instances",obj)	
	inst.start = _start
	if _start == false inst.scalax = 0 
	end_act()
}
function npc_despawn(obj){
	
	if !instance_exists(obj){ end_act() }else if obj.despawn = false{ obj.despawn = true obj.alarm[0] = 90 }
 
}

//function play_cutscene_sound(index,priority,loop,gain,offset){
	//if !start {audio_play_sound(index,priority,loop,gain,offset); start = true}
	//if !audio_is_playing(index) end_act()
//}
// ===============================
// CAPÍTULO 1 - A PRINCESA
// ===============================


cutscene_teste = [
	function(){start_act()},
	function(){move_add(oIdoso,-300,-300,2); oIdoso.estado = "andando"},
	function(){oIdoso.estado = "parado"; end_cutscene()},

]

// CAP1_FLORESTA_INICIO
Cutscene_Floresta_Inicio = [
    function(){start_act()},
	function(){oPrincipe.estado = "andando";  move_to_speed(oPrincipe,1194,1671,global.vel_cutscene); },
	function(){move_to_speed(oPrincipe,1537,1501,250);},
	function(){move_to_speed(oPrincipe,1187,1278,250);},
	function(){move_to_speed(oPrincipe,1754,924,250);},
	function(){;oPrincipe.estado = "parado";new_dialogue(Dialogo_Floresta)},
    function(){end_cutscene()},
    

];


// CAP1_CAMINHO_TORRE
Cutscene_Caminho_Torre = [
	
    function(){start_act();},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,281,44,global.vel_cutscene);},
	function(){ room_change(rm_torre);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1970,1880,global.vel_cutscene);},
	//function(){move_add(oIdoso,-300,-300,2); oIdoso.estado = "andando"},
    function(){;oPrincipe.estado = "parado";new_dialogue(Dialogo_Torre);},
    function(){end_cutscene()},
];


// CAP1_CAMINHO_ESCURIDAO
Cutscene_Caminho_Escuridao = [
    function(){start_act()},
	//function(){move_add(oIdoso,-300,300,2); oIdoso.estado = "andando"},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,3331,-66,global.vel_cutscene);},
	function(){ room_change(rm_bosque);},
    function(){new_dialogue(Dialogo_Escuridao)},
    function(){end_cutscene()}
];


// CAP1_TORRE_PORTA
Cutscene_Torre_Porta = [
    function(){start_act()},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1690,1990,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1440,1820,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1060,2040,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,325,1560,global.vel_cutscene);},
    function(){oPrincipe.estado = "parado"; new_dialogue(Dialogo_Porta)},
    function(){end_cutscene()}
];


// CAP1_TORRE_JANELA
Cutscene_Torre_Janela = [
    function(){start_act()},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1690,1990,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1440,1820,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1390,1185,global.vel_cutscene);},
    function(){oPrincipe.estado = "parado";new_dialogue(Dialogo_Janela)},
    function(){end_cutscene()}
];


// CAP1_MAGO_MAL
Cutscene_Mago_Mal = [
    function(){start_act()},
	function(){npc_spawn(oMagoMal,185,1385,false)},
    function(){play_cutscene_sound(sfxMagoMal, 0, 0, 2, 0, 1.5)},
    function(){new_dialogue(dialogo_Porta_MgMal)},
	function(){npc_despawn(oPrincipe)},
	function(){room_change(rm_quarto_princesa)},
    function(){end_cutscene()}
];


// CAP1_MAGO_BOM
Cutscene_Mago_Bom = [
    function(){start_act()},
	function(){npc_spawn(oMagoBom,185,1385,false)},
  	function(){play_cutscene_sound(sfx_harpa_mago_aparece, 0, 0, 2, 0)},
    function(){new_dialogue(dialogo_Porta_MgBom)},
	function(){particle_create(oPrincipe)},
	function(){npc_despawn(oPrincipe)},
	function(){room_change(rm_quarto_princesa)},
    function(){end_cutscene()}
];

Cutscene_Mago_Sapo = [
	function(){start_act()},
	function(){npc_spawn(oMagoSapo,185,1385,false)},
    function(){play_cutscene_sound(sfxMagoSapo, 0, 0, 2, 0)},
	function(){oMagoSapo.estado = "andando";move_to_speed(oMagoSapo,oPrincipe.x,oPrincipe.y,global.vel_cutscene);},
	function(){oMagoSapo.scala_x_temp = -.05; oMagoSapo.scala_y_temp = .25; end_act()},
    
    function(){play_cutscene_sound(sfxMordida, 0, 0, 2, 0)},
	function(){npc_despawn(oPrincipe)},
	function(){new_dialogue(dialogo_Porta_MgSapo)},
	function(){room_change(rm_quarto_princesa)},
    function(){end_cutscene()}
];



// CAP1_ESCALAR_TORRE
Cutscene_Escalar_Torre = [
    function(){start_act()},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1200,1180,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1200,1080,global.vel_cutscene/3);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1200,880,global.vel_cutscene/6);},
	function(){wait_in(.5)},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1200,1380,global.vel_cutscene*4);},
	function(){play_cutscene_sound(sfxTuc, 0, 0, 2, 2.10)},
    function(){particle_create(oPrincipe)},
	function(){particle_create(oPrincipe)},
	function(){npc_despawn(oPrincipe)},
    function(){new_dialogue(Dialogo_Cair)},
	function(){room_change(rm_quarto_princesa)},
    function(){end_cutscene()}
];


// CAP1_GRITAR_PRINCESA
Cutscene_Gritar_Princesa = [
    function(){start_act()},
   	function(){play_cutscene_sound(sfxJogaCorda, 0, 0, 2, 0, 1.5)},
	function(){obj_lencol.abrir = true; wait_in(3)},
    function(){new_dialogue(Dialogo_Gritar)},
	function(){room_change(rm_quarto_princesa)},
    function(){end_cutscene()}
];


// CAP1_LUZ_FLORESTA
Cutscene_Luz_Floresta = [
    function(){start_act()},
	function(){oBrilho.destroy = true end_act()},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,oBrilho.x,oBrilho.y,global.vel_cutscene);},
	function(){instance_destroy(obj_moita);particle_create(oPrincipe) npc_despawn(oPrincipe) new_shake(10,.95)},
    function(){play_cutscene_sound(sfxArmadilha, 0, 0, 4)},
    function(){new_dialogue(Dialogo_Luz)},
	function(){room_change(rm_quarto_princesa)},
    function(){end_cutscene()}
];


// CAP1_CASA_MAGO
Cutscene_Casa_Mago = [
    function(){start_act()},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1570,1100,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1430,890,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1150,770,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,900,900,global.vel_cutscene);},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,865,865,global.vel_cutscene);},
    function(){new_dialogue(Dialogo_Casa)},
    function(){end_cutscene()}
];


// CAP1_ENTRAR_CASA
Cutscene_Entrar_Casa = [
    function(){start_act()},
	function(){obj_porta_casa.sprite_index = spr_casa_aberta; end_act()},
    function(){play_cutscene_sound(sfxAbrePorta, 0, 0, 1, 0)},
	function(){npc_despawn(oPrincipe)},
	function(){wait_in(1)},
    function(){play_cutscene_sound(sfxMagic, 0, 0, 1, 0, 1.2)},
	function(){obj_porta_casa.scalax= 1.5;  particle_create(obj_porta_casa) new_shake(10,.95)},
	function(){wait_in(1)},
    function(){play_cutscene_sound(sfxMagoSapo, 0, 0, 1, 0)},
    function(){new_dialogue(Dialogo_Abrir)},
	function(){room_change(rm_quarto_princesa)},
    function(){end_cutscene()}
];


// CAP1_BATER_CASA
Cutscene_Bater_Casa = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Bater)},
    function(){play_cutscene_sound(sfxTocToc, 0, 0, 1, 0)},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,1120,700,global.vel_cutscene);},
	function(){obj_porta_casa.sprite_index = spr_casa_aberta npc_spawn(oMagoBom,865,865,false)},
	function(){play_cutscene_sound(sfxAbrePorta, 0, 0, 1, 0)},
    function(){wait_in(1)},
    function(){play_cutscene_sound(sfx_harpa_mago_aparece, 0, 0, 1, 0)},
	function(){npc_despawn(oPrincipe)},
    
	function(){room_change(rm_quarto_princesa)},
    function(){end_cutscene()}
];
// ===============================
// CUTSCENES: QUARTO DA PRINCESA (COM PRÍNCIPE)
// ===============================

// QUARTO_PRINCESA_COMPRIN
Cutscene_Quarto_Princesa_ComPrincipe = [
    function(){start_act()},
	function(){npc_spawn(oPrincipe,oPrincesa.x + 250,oPrincesa.y + 250,false)},
    function(){new_dialogue(Dialogo_Quarto_Princesa_ComPrincipe)},
    function(){end_cutscene()}
];

// QUARTO_ABRACAR
Cutscene_Quarto_Abracar = [
    function(){start_act()},
	function(){oPrincesa.estado = "andando";move_to_speed(oPrincesa,oPrincipe.x,oPrincipe.y,global.vel_cutscene);},
	function(){play_cutscene_sound(sfxBeso, 0, 0, 2, 0)},
    function(){oPrincesa.estado = "parado";wait_in(1)},
    function(){new_dialogue(Dialogo_Quarto_Abracar)},
    function(){end_cutscene()}
];


Cutscene_Quarto_Matar = [
    function(){start_act()},
	function(){oPrincesa.estado = "andando";move_to_speed(oPrincesa,oPrincipe.x,oPrincipe.y,global.vel_cutscene);},
	function(){oPrincesa.estado = "parado" end_act()},
	function(){oPrincesa.scala_x_temp = -.05; oPrincesa.scala_y_temp = .25; end_act()},
	function(){particle_create(oPrincipe)},
    function(){play_cutscene_sound(sfxSoco, 0, 0, 1,  0.32)},
	function(){npc_despawn(oPrincipe)},
	function(){new_dialogue(Dialogo_Quarto_Matar)},
    function(){end_cutscene()}
];



Cutscene_Quarto_Porta_Pr = [
    function(){start_act()},
	function(){oPrincipe.estado = "andando";move_to_speed(oPrincipe,2470,1390,global.vel_cutscene);},
    function(){play_cutscene_sound(sfxPortaMetal, 0, 0, 5, 0)},
    function(){oPrincipe.estado = "parado";new_dialogue(Dialogo_Quarto_Porta_So); obj_porta.sprite_index = spr_porta_aberta_princesa;},
    
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
    function(){play_cutscene_sound(sfxMagoMal, 0, 0, 1, 0)},
	function(){npc_spawn(oMagoMal,2656,1312,false)},
	function(){wait_in(1)},
	function(){particle_create(oPrincipe);npc_despawn(oPrincipe);},
	function(){particle_create(oPrincesa);npc_despawn(oPrincesa);},
    function(){new_dialogue(Dialogo_Quarto_MgMal_Pr)},
    function(){end_cutscene()}
];


// QUARTO_MGBOM_PR
Cutscene_Quarto_MgBom_Pr = [
    function(){start_act()},
    function(){play_cutscene_sound(sfx_harpa_mago_aparece, 0, 0, 1, 0)},
	function(){npc_spawn(oMagoBom,2656,1312,false)},
	function(){wait_in(1)},
    function(){play_cutscene_sound(sfx_harpa_mago_aparece, 0, 0, 1, 0)},
	function(){npc_despawn(oPrincipe);},
    function(){play_cutscene_sound(sfx_harpa_mago_aparece, 0, 0, 1, 0)},
	function(){npc_despawn(oPrincesa);},
    function(){play_cutscene_sound(sfx_harpa_mago_aparece, 0, 0, 1, 0)},
	function(){npc_despawn(oMagoBom);},
    function(){new_dialogue(Dialogo_Quarto_MgBom_Pr)},
    function(){end_cutscene()}
];


// QUARTO_REI_PR
// QUARTO_REI_PR
Cutscene_Quarto_Rei_Pr = [
    function(){start_act()},
	function(){npc_spawn(oRei,2656,1312,false)},
    function(){play_cutscene_sound(sfxRei, 0, 0, 1, 0)},
	function(){oPrincesa.estado = "andando";move_to_speed(oPrincesa,oRei.x,oRei.y,global.vel_cutscene);},
	function(){oPrincesa.estado = "parado";wait_in(1)},
    function(){new_dialogue(Dialogo_Quarto_Rei_Pr)},
    function(){end_cutscene()}
];



// QUARTO_SAPO_PR
Cutscene_Quarto_Sapo_Pr = [
    function(){start_act()},
	function(){start_act()},
	function(){npc_spawn(oMagoSapo,2656,1312,false)},
    function(){play_cutscene_sound(sfxMagoSapo, 0, 0, 1, 0)},
	function(){oMagoSapo.estado = "andando";move_to_speed(oMagoSapo,oPrincipe.x,oPrincipe.y,global.vel_cutscene);},
	function(){oMagoSapo.scala_x_temp = -.05; oMagoSapo.scala_y_temp = .25; end_act()},
    function(){play_cutscene_sound(sfxMordida, 0, 0, 1, 0)},
	function(){npc_despawn(oPrincipe)},
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
	function(){oPrincesa.estado = "andando";move_to_speed(oPrincesa,1440,1100,global.vel_cutscene);},
    function(){oPrincesa.estado = "parado"; new_dialogue(Dialogo_Quarto_Janela)},
    function(){ end_cutscene()}
];


// QUARTO_JANELA_MORTE
Cutscene_Quarto_Janela_Morte = [
    function(){start_act()},
    function(){start_act(); obj_janela.sprite_index = spr_janela_aberta_princesa},
    function(){play_cutscene_sound(sfxJanelaOpen, 0, 0, 2)},
	function(){npc_despawn(oPrincesa)},
	function(){wait_in(1)},
    function(){play_cutscene_sound(sfxTuc, 0, 0, 2, 2.1)},
	function(){ new_shake(10,.95) end_act()},
	function(){wait_in(0.5)},
    function(){new_dialogue(Dialogo_Quarto_Janela_Morte)},
    function(){end_cutscene()}
];


// QUARTO_JANELA_LENCOL
Cutscene_Quarto_Janela_Lencol = [
    function(){start_act()},
	function(){obj_janela.sprite_index = spr_janela_aberta_princesa; npc_despawn(obj_cortina)},
	function(){wait_in(.5)},
    function(){play_cutscene_sound(sfxJogaCorda, 0, 0, 1, 0)},
	function(){npc_despawn(oPrincesa)},
	function(){wait_in(1)},
    function(){new_dialogue(Dialogo_Quarto_Janela_Lencol)},
    function(){end_cutscene()}
];


// QUARTO_ESPERAR
Cutscene_Quarto_Esperar = [
    function(){start_act()},
    function(){play_cutscene_sound(sfxRelogio, 0, 0, 4, 0, 2)},
    function(){wait_in(10)},
    function(){oPrincesa.sprite_index = spr_ossos play_cutscene_sound(sfxSino, 0, 0, 2, .5)},
    function(){new_dialogue(Dialogo_Quarto_Esperar)},
    function(){end_cutscene()}
];

// QUARTO_CAMA
Cutscene_Quarto_Cama = [
    function(){start_act()},
	function(){oPrincesa.estado = "andando";move_to_speed(oPrincesa,2016,1248,global.vel_cutscene);},
	function(){particle_create(oPrincesa);},
    function(){play_cutscene_sound(sfxMordida, 0, 0, 4, 0, 2)},
	function(){npc_despawn(oPrincesa);},
    function(){new_dialogue(Dialogo_Quarto_Cama)},
    function(){end_cutscene()}
];


// QUARTO_PORTA_SO
Cutscene_Quarto_Porta_So = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Porta_So)},
	function(){oPrincesa.estado = "andando";move_to_speed(oPrincesa,2470,1390,global.vel_cutscene);},
    function(){oPrincesa.estado = "parado";new_dialogue(Dialogo_Quarto_Porta_So)},
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
    function(){play_cutscene_sound(sfxPortaMetal, 0, 0, 5, 0)},
	function(){obj_porta.sprite_index = spr_porta_aberta_princesa end_act()},
    function(){new_dialogue(Dialogo_Quarto_Porta_Chave)},
    function(){end_cutscene()}
];


// QUARTO_MAGO_SO
Cutscene_Quarto_Mago_So = [
    function(){start_act()},
    function(){new_dialogue(Dialogo_Quarto_Mago_So)},
    
    function(){end_cutscene()}
];

// QUARTO_MAGO_SO
Cutscene_Quarto_MgBom_So = [
    function(){start_act()},
        function(){play_cutscene_sound(sfx_harpa_mago_aparece, 0, 0, 1, 0)},
	function(){npc_spawn(oMagoBom,2656,1312,false)},
	function(){wait_in(1)},
	function(){npc_despawn(oPrincesa);},
	function(){npc_despawn(oMagoBom);},
    function(){new_dialogue(Dialogo_Quarto_MgBom_So)},
    function(){end_cutscene()}
];

Cutscene_Quarto_MgMal_So = [
    function(){start_act()},
        function(){play_cutscene_sound(sfxMagoMal, 0, 0, 1, 0)},
	function(){npc_spawn(oMagoMal,2656,1312,false)},
	function(){wait_in(1)},
	function(){npc_despawn(oPrincesa);},
    function(){new_dialogue(Dialogo_Quarto_MgMal_So)},
    function(){end_cutscene()}
];

// QUARTO_REI_SO
Cutscene_Quarto_Rei_So = [
    function(){start_act()},
        function(){play_cutscene_sound(sfxRei, 0, 0, 1, 0)},
	function(){npc_spawn(oRei,2656,1312,false)},
	function(){oPrincesa.estado = "andando";move_to_speed(oPrincesa,oRei.x,oRei.y,global.vel_cutscene);},
	function(){oPrincesa.estado = "parado";wait_in(1)},
    function(){new_dialogue(Dialogo_Quarto_Rei_So)},
    function(){end_cutscene()}
];


// QUARTO_SAPO_SO
Cutscene_Quarto_Sapo_So = [
    function(){start_act()},
        function(){play_cutscene_sound(sfxMagoSapo, 0, 0, 1, 0)},
	function(){npc_spawn(oMagoSapo,2656,1312,false)},
	function(){oMagoSapo.estado = "andando";move_to_speed(oMagoSapo,oPrincesa.x,oPrincesa.y,global.vel_cutscene);},
	function(){oMagoSapo.scala_x_temp = -.05; oMagoSapo.scala_y_temp = .25; end_act()},
    function(){play_cutscene_sound(sfxMordida, 0, 0, 1, 0)},
	function(){npc_despawn(oPrincesa)},
    function(){new_dialogue(Dialogo_Quarto_Sapo_So)},
    function(){end_cutscene()}
];


global.cutscenes = [

	cutscene_teste,
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
	
	CUT_TESTE,
	CUT_FLORESTA,
	
	CUT_TORRE,
    CUT_ESCURIDAO,
	
	CUT_PORTA,
	CUT_JANELA,
	
	CUT_MGMAL,
	CUT_MGBOM,
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
