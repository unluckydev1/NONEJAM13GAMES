scala_x_temp = .4
scala_y_temp = -.4
//instance_create_layer(x,y - 24, layer, oPum)

repeat (10) {
	instance_create_layer(x,y - 32, "Particulas", oParticle)
}
if(destroi) instance_destroy()
var_desbloqueada = true