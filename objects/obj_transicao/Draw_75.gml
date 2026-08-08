display_set_gui_size(view_get_wport(view_camera[0]), view_get_hport(view_camera[0]));

randomize()

for (var i = 0; i < linhas; i++){
    for (var j = 0; j < cols; j++) {
        var _limite = min(max(0, img_ini-j-i), img_num);
        
    	draw_sprite_ext(spr_quadradin, _limite, j * tamanho, i * tamanho, 1, 1, 0, #191216, 1);
    }
}