draw_self();

draw_set_font(fnt_fonte2);
draw_set_colour(c_black);
draw_set_halign(fa_center);
draw_text_ext(x, y - 22, "Maior\nPontuacao:\n" + string(pontosExibidos), 13, 100);
draw_set_halign(fa_left);
draw_set_font(-1);
