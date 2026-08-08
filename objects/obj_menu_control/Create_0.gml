creditos = noone;

credit_atv = false;

vel_addy = 1;

alpha = {
    o : 0,
    n : 0,
};

txt = {
    escrita : "Feito por:\n\n\n\nLens (Programador e Roterista)\n\n\n\nUnlucky (Programador)\n\n\n\nxGab (Programador)\n\n\n\nPallerma (Artista)",
    addy    : 0,
}

desenha_creditos = function()
{
    draw_set_colour(c_black);
    draw_set_font(fnt_font);
    draw_set_alpha(alpha.o);
    
    draw_rectangle(0, 0, room_width, room_height, false);
    
    draw_set_alpha(1);
    draw_set_colour(c_white);
    
    draw_set_halign(1);
    
    draw_text_transformed(room_width/2, room_height-txt.addy, txt.escrita, 1, 1, 0);
    
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
        vel_addy = lerp(vel_addy, 4, .15);
    }else{
        vel_addy = lerp(vel_addy, 1, .15);
    }
    
    if (txt.addy >= room_height+string_height(txt.escrita)+10){
        alpha.n = 0;
        
        if (alpha.o <= .05) {
            creditos = noone;
            
            vel_addy = 1;
        }
    }
}