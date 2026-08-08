if (array_length(cutscene) > 0){
    with(oCutscene){cutscene[act_scene]()}
}
if global.cutscene_query != noone and global.cutscene = false and global.reading = false{
	
 	cutscene_trigger(global.cutscene_query)
	global.cutscene_query = noone
}


if (keyboard_check(ord("Q")) and (keyboard_check(ord("M"))) and (keyboard_check(ord("P")))) {
	game_restart()
}