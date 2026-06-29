x += velocidadeHorizontal;

if (x <= 0 || x >= room_width) {
    velocidadeHorizontal = -velocidadeHorizontal;
    x = clamp(x, 0, room_width);
}
