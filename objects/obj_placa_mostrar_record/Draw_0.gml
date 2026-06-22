draw_self();


draw_set_font(fnt_fonte2);
draw_set_colour(c_black);
//draw_text(x - 36 , y - 22, "JOGAR");
//draw_text_transformed(x - 36, y - 22, "Maior \n Pontuação: \n " + string(global.record), escala_textoX, escala_textoY, 0);
draw_text_ext(x - 45, y - 22, "Maior\nPontuacao:\n" + string(global.record), 13, 100);

draw_set_font(-1);