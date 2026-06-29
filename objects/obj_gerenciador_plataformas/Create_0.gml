espacamentoMinimo = 70;
espacamentoMaximo = 110;
yGerado = room_height;

gerarAcai = function(_plataforma, _tipoPlatforma) {
    var _sorteio = irandom(99);
    var _frame;

    if (_tipoPlatforma == obj_plataforma_folha || _tipoPlatforma == obj_plataforma_passaros) {
        if      (_sorteio < 15) _frame = 2;   // 15% - 10pts
        else if (_sorteio < 35) _frame = 1;   // 20% - 5pts
        else if (_sorteio < 45) _frame = 0;   // 10% - 2pts
        else return;                           // 55% - nenhum
    } else {
        if      (_sorteio < 5)  _frame = 2;   //  5% - 10pts
        else if (_sorteio < 25) _frame = 1;   // 20% - 5pts
        else if (_sorteio < 40) _frame = 0;   // 15% - 2pts
        else return;                           // 60% - nenhum
    }

    var _acai = instance_create_layer(_plataforma.x, _plataforma.y, "Instances", obj_acai);
    _acai.image_index       = _frame;
    _acai.plataformaParente = _plataforma;
    _acai.offsetX           = 0;
    _acai.offsetY           = -16;
}

gerarPlataforma = function(_y) {
    var _x = 16 + irandom(room_width - 32);
    var _chance = irandom(9);
    var _objeto;
    if (_chance <= 3) {
        _objeto = obj_plataforma_folha;
    } else if (_chance <= 6) {
        _objeto = obj_plataforma_passaros;
    } else {
        _objeto = obj_plataforma_tronco;
    }
    var _plataforma = instance_create_layer(_x, _y, "Instances", _objeto);
    gerarAcai(_plataforma, _objeto);
}
