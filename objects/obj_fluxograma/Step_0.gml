puxa_mouse();

//show_debug_message(string("{0}   {1}", addx[0], addy[0]));

if (keyboard_check_pressed(ord("T"))){
    
    libera_node(global.node_names.p2);
    libera_node(global.node_names.p5);
    libera_node(global.node_names.p6);
    libera_node(global.node_names.p8);
    libera_node(global.node_names.p9);
    libera_node(global.node_names.p10);
}

//show_debug_message(array_length(global.liberados));