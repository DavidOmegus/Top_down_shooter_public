/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_sprite_ext(sprite_index,image_index,x,y,esc_x,esc_y,image_angle,c_white,alpha);

esc_x = lerp(esc_x,image_xscale,.2);
esc_y = lerp(esc_y,image_yscale,.2);

//draw_set_halign(1);
//draw_set_valign(1);
//draw_set_font(fnt_principal);

//draw_text_color(x,y,room,cor,cor,cor,cor,1);

//draw_set_font(-1);
//draw_set_halign(-1);
//draw_set_valign(-1);