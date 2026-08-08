// Inherit the parent event
event_inherited();

nodes = global.nodes.fluxo2;
liberados = global.liberados.fluxo2;
puxa_tudo(global.node_setting_princesa,nodes,liberados)


array_push(liberados, nodes[0]);

nodes[0].alp = 1;
nodes[0].can = true;
nodes[0].apear = true; //Faz parte da animacao