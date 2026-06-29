if (!gameOver) exit;

var _largura = display_get_gui_width();
var _altura  = display_get_gui_height();
var _centroX = _largura / 2;

draw_set_alpha(0.6);
draw_set_colour(c_black);
draw_rectangle(0, 0, _largura, _altura, false);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_fonte);
draw_set_colour(c_white);
draw_text(_centroX, _altura / 2 - 50, "Fim de Jogo\nSua pontuacao foi: " + string(global.pontos));

draw_set_font(fnt_fonte2);
draw_text(_centroX, 80, "Pressione ESC para voltar ao menu");
draw_text(_centroX, _altura - 80, "Pressione espaço para continuar");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
