/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_set_font(fnt_pontos_game);
draw_set_color(cores);
draw_set_halign(1)

draw_text_ext_transformed(x,y,text+"!",8,10,tam,tam,image_angle);

draw_set_halign(-1);
draw_set_color(-1);
draw_set_font(-1);