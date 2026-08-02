if (array_length(cutscene) > 0){
    with(oCutscene){cutscene[act_scene]()}
}

if global.cutscene_query != noone and global.cutscene = false and global.reading = false{
	
 	cutscene_trigger(global.cutscene_query)
	global.cutscene_query = noone
}