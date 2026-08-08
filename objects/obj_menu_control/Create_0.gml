creditos = noone;

credit_atv = false;

vel_addy = 1;

alpha = {
    o : 0,
    n : 0,
};

frames = [0, 0, 0, 0];

txt = {
    escrita : string("Feito por:\n\n\nLens (Programador e Roterista)\n[spr_coin, {0}]\nUnlucky (Programador)\n[spr_coin, {1}]\nxGab (Programador)\n[spr_coin, {2}]\nPallerma (Artista)\n[spr_coin, {3}]", 
    frames[0], frames[1], frames[2], frames[3]),
    
    addy    : 0,
}

escala = 1;

desenha_creditos = function()
{
    draw_set_colour(#32242D);
    draw_set_font(fnt_menu2);
    draw_set_alpha(alpha.o);
    
    draw_rectangle(0, 0, room_width, room_height, false);
    
    draw_set_alpha(1);
    draw_set_colour(c_white);
    
    draw_set_halign(1);
    
    //draw_set_colour(c_black);
    //draw_text_transformed(room_width/2, room_height-txt.addy+(5*escala), txt.escrita, escala, escala, 0);
    //draw_set_colour(c_white);
    //draw_text_transformed(room_width/2, room_height-txt.addy, txt.escrita, escala, escala, 0);
    
    var _txt = scribble(txt.escrita);
    
    _txt.gradient(#FF87BA, 1.4);
    _txt.starting_format("fnt_menu2_sombra", "c_white");
    _txt.align(1, 0);
    _txt.blend(#EDB966, 1);
    _txt.transform(escala, escala, 0);
    _txt.draw(room_width/2, room_height-txt.addy);
    
    draw_set_font(-1);
    draw_set_halign(-1);
    
    alpha.o = lerp(alpha.o, alpha.n, .05);
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
        vel_addy = lerp(vel_addy, 8, .15);
    }else{
        vel_addy = lerp(vel_addy, 4, .15);
    }
    
    draw_set_font(fnt_menu2);
    
    if (txt.addy >= room_height+((string_height_scribble(txt.escrita))*escala)){
        alpha.n = 0;
        
        if (alpha.o <= .05) {
            creditos = noone;
            
            vel_addy = 1;
            txt.addy = 0;
        }
    }
}