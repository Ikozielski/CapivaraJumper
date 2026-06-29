mouseClick = mouse_check_button(mb_left);

if (mouseSobre && mouseClick) {
    room_goto(rm_jogo);
}

if (pontosExibidos < global.record) {
    pontosExibidos += max(1, ceil((global.record - pontosExibidos) / 20));
    pontosExibidos  = min(pontosExibidos, global.record);
}
