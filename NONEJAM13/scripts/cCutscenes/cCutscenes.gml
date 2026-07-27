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
    oCutscene.cutscene = G.cutscenes[_cutscene]
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
Cutscene1=[
    function(){start_act()},
    function(){change_face(oManu,1,true)},
    function(){move_to(oManu,730,oManu.y,1)},
    function(){change_face(oManu,0,true)},
    function(){move_to(oManu,oManu.x,350,1)},
    function(){change_face(oManu,1,true,-1)},
    function(){move_to(oManu,860,oManu.y,1)},
    function(){change_face(oManu,0,true)},
    function(){move_add(oManu,0,200,1)}, 
    function(){player_change(POV.Lucas)},
    function(){new_dialogue([
        Texto("Lucas ", "uh, oque é isso?..."),
        Texto("","Ao colocar as mãos no bolso você sente duas embalagens de doces..."),
        Texto(" ","vazias..."),
        Texto("Lucas","ah, porhherhrhwaergar"),
        Texto("Lucas","ghrhtrhsth",-1)
    ])},
    function(){end_cutscene()}
]
global.cutscenes = [Cutscene1]