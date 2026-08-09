if (!instance_exists(obj_control_mouse)) instance_create_depth(0, 0, 0, obj_control_mouse);

if !audio_is_playing(snd_gameplay) audio_play_sound(snd_gameplay,0,1)
reset_object(oCutscene)