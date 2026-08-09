creditos = noone;

credit_atv = false;

vel_addy = 1;

alpha = {
    o : 0,
    n : 0,
};

frames = [[spr_lens, 0], [spr_unlucky, 0], [spr_gab, 0], [spr_pallerma, 0]];
spd = 5;

txt = {
    escrita : string("[#EDB966]Feito por:\n\n\n[wave][#6F278A]Lens (Programador e Roterista)\n[/c][spr_lens, {0}]\n\n[#259451]Unlucky (Programador)\n[/c][spr_unlucky, {1}]\n\n[#4F62BD]xGab (Programador)\n[/c][spr_gab, {2}]\n\n[#C52589]Pallerma (Artista e Musico)\n[/c][spr_pallerma, {3}]", 
    frames[0][1], frames[1][1], frames[2][1], frames[3][1]),
    
    addy    : 0,
}

escala = 1;

desenha_creditos = function()
{
    scribble_anim_wave(5, .4, .01);
    
    draw_set_colour(#32242D);
    draw_set_font(fnt_menu2);
    draw_set_alpha(alpha.o);
    
    draw_rectangle(0, 0, room_width, room_height, false);
    
    draw_set_alpha(1);
    draw_set_colour(c_white);
    
    draw_set_halign(1);
    
    //Fazer os negocio aumenta os frames
    for (var i = 0; i < array_length(frames); i++) {
        var _frame = frames[i];
        
    	var _vel = sprite_get_speed(_frame[0]);
        
        var _addspd = _vel/game_get_speed(gamespeed_fps);
        
        _frame[1] += _addspd;
        
        if (_frame[1] + _addspd >= _vel){
            _frame[1] = 0;
        }
    }
    
    //draw_set_colour(c_black);
    //draw_text_transformed(room_width/2, room_height-txt.addy+(5*escala), txt.escrita, escala, escala, 0);
    //draw_set_colour(c_white);
    //draw_text_transformed(room_width/2, room_height-txt.addy, txt.escrita, escala, escala, 0);
    
    var _txt = scribble(txt.escrita);
    
    _txt.gradient(#FF87BA, .5);
    _txt.starting_format("fnt_menu2_sombra", "c_white");
    _txt.align(1, 0);
    _txt.transform(escala, escala, 0);
    _txt.draw(room_width/2, room_height-txt.addy);
    
    draw_set_font(-1);
    draw_set_halign(-1);
    
    alpha.o = lerp(alpha.o, alpha.n, .05);
    
    txt.escrita = string("[#EDB966]Feito por:\n\n\n[wave][#6F278A]Lens (Programador e Roterista)\n[/c][spr_lens, {0}]\n\n[#259451]Unlucky (Programador)\n[/c][spr_unlucky, {1}]\n\n[#4F62BD]xGab (Programador)\n[/c][spr_gab, {2}]\n\n[#C52589]Pallerma (Artista e Musico)\n[/c][spr_pallerma, {3}]", 
    frames[0][1], frames[1][1], frames[2][1], frames[3][1]);
    
    scribble_anim_wave(1,.1,.1);
}

escurece_tela = function()
{
    alpha.n = .6;
    
    if (alpha.o >= alpha.n-.05){
        creditos = aparece_letras;
    }
}

aparece_letras = function()
{
    txt.addy += vel_addy;
    
    if (keyboard_check(vk_space)){
        vel_addy = lerp(vel_addy, 10, .15);
    }else{
        vel_addy = lerp(vel_addy, 4, .15);
    }
    
    draw_set_font(fnt_menu2);
    
    if (txt.addy >= room_height+((string_height_scribble(txt.escrita)+10)*escala)){
        alpha.n = 0;
        
        if (alpha.o <= .05) {
            creditos = noone;
            
            vel_addy = 1;
            txt.addy = 0;
        }
    }
}