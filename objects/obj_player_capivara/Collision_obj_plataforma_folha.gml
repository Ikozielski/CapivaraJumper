if (velocidadeVertical > 0 && !other.caindo) {
    velocidadeVertical = -forcaPulo;
    other.caindo = true;
    instance_create_layer(x, bbox_bottom, "Instances", obj_player_efeito_pulo);
}
