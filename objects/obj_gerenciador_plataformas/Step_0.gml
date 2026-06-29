var _cam     = view_camera[0];
var _viewY   = camera_get_view_y(_cam);
var _viewAltura = camera_get_view_height(_cam);

// Mantém o background ancorado à câmera para cobrir o scroll infinito
var _sprH = sprite_get_height(spr_bg_menu);
layer_y("Background", _viewY - ((_viewY mod _sprH + _sprH) mod _sprH));

// Gera plataformas até um screen acima da câmera
while (yGerado > _viewY - _viewAltura) {
    yGerado -= espacamentoMinimo + irandom(espacamentoMaximo - espacamentoMinimo);
    gerarPlataforma(yGerado);
}

// Destrói plataformas abaixo da câmera
var _limiteDestrucao = _viewY + _viewAltura + 64;
with (obj_plataforma_tronco) {
    if (y > _limiteDestrucao) instance_destroy();
}
with (obj_plataforma_passaros) {
    if (y > _limiteDestrucao) instance_destroy();
}
