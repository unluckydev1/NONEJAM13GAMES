tamanho = sprite_get_width(spr_quadradin);
cols    = ceil(room_width / tamanho);
linhas  = ceil(room_height/tamanho);

//Animacao
img_ini = 0;
img_spd = sprite_get_speed(spr_quadradin) / game_get_speed(gamespeed_fps);
img_num = sprite_get_number(spr_quadradin)-1;

//Indo
destino = noone;
indo = true;

toca = true