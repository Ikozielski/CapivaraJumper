if (!instance_exists(plataformaParente)) {
    instance_destroy();
    exit;
}

x = plataformaParente.x + offsetX;
y = plataformaParente.y + offsetY;
