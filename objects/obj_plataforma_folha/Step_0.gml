if (!caindo) exit;

velocidadeVertical += gravidade;
y += velocidadeVertical;

var _cam = view_camera[0];
if (y > camera_get_view_y(_cam) + camera_get_view_height(_cam)) {
    instance_destroy();
}
