gravidade = 0.4;
forcaPulo = 10;
velocidadeHorizontalMaxima = 2;
velocidadeVertical = 0;
gameOver = false;

estadoCaindo = function() {
    var _direcao = keyboard_check(vk_right) - keyboard_check(vk_left);
    x += _direcao * velocidadeHorizontalMaxima;

    velocidadeVertical += gravidade;
    y += velocidadeVertical;

    var _cam      = view_camera[0];
    var _viewAltura = camera_get_view_height(_cam);
    var _viewY    = camera_get_view_y(_cam);

    if (y < _viewY + _viewAltura * 0.35) {
        camera_set_view_pos(_cam, 0, y - _viewAltura * 0.35);
    }

    if (y > _viewY + _viewAltura) {
        if (global.pontos > global.record) {
            global.record = global.pontos;
        }
        gameOver = true;
        estado = estadoGameOver;
    }
}

estadoGameOver = function() {
    if (keyboard_check_pressed(vk_space)) {
        global.pontos = 0;
        room_restart();
    }
    if (keyboard_check_pressed(vk_escape)) {
        global.pontos = 0;
        room_goto(rm_menu);
    }
}

estado = estadoCaindo;
