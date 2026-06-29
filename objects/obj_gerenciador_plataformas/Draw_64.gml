draw_set_font(fnt_fonte);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(10, 10, "Pontos: " + string(global.pontos));
draw_set_font(-1);
