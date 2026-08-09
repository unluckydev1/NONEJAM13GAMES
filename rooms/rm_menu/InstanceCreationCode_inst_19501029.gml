action = function()
{
    if (instance_exists(obj_menu_control)){
        with (obj_menu_control) {
        	creditos = escurece_tela;
        }
        audio_play_sound(sfxcreditos,0, 0)
    }
}