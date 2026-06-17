draw_self();


draw_set_font(fnt_fonte);
draw_set_colour(c_black);
//draw_text(x - 36 , y - 22, "JOGAR");
draw_text_transformed(x - 36, y - 22, "JOGAR", escala_textoX, escala_textoY, 0);

draw_set_font(-1);