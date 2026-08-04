var _matrix = matrix_build(0, 0, 0, 0, 0, 0, escala, escala, 1);
matrix_set(matrix_world, _matrix);

desenha_nodes();

matrix_set(matrix_world, matrix_build_identity());