appear = true
largura_encaixe = 0 
alp = 0
global.reading = true
text_width = (guiw - 128)
text_height = guih/4
contains = false
//sfx_dialogo =
pitch_range = .75
borderx = 32
bordery = 28
line_sep = 24
line_width = text_width - borderx*2
str_encaixe = 0
choices = false
select = 0

///Create
typist = scribble_typist();
typist.ease(SCRIBBLE_EASE.EXPO, 0, -12, 0, 0, 360, .5)
typist.in(0.37, 2);
typist.sound_per_char(sfxDialogo, 1.5,1.8, " ")
typist.character_delay_add(",", .2)
typist.character_delay_add(".", .2)
text_to_draw = 0
page = 0
page_number = 0
text[10] = {}
text_length[0] = string_length(text[0])
draw_char = 0
text_spd = .5

txtb_spr = spr_text_box
txtb_img = 0
txtb_img_spd = 6/60

selected = 0
assigned_portrait = true
portrait = false
setup = false

can_pass = true

choosing = false
/*choose_dialogue = function(pos){
    
    for(var i = 0; i < array_length(father.texts[0][pos]); i ++){
        text[i] = father.texts[0][pos][i]
    } page = 0
    page_number = 0
    text_length[0] = string_length(text[0])
    draw_char = 0
    setup = false
    choices = false
}*/
destroy = function(){
    global.reading = false
    instance_destroy()
    exit;
}


#region teste

text= [
    {
        text: "lorem ipsum",
        speaker: "Lucas"
    },
    {
        text: "oi meu nome é meu cavalo",
        speaker: "Lucas"
    }
]
#endregion