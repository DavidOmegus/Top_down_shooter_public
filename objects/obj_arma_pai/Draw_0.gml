/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//desenhando a arma para o stretch and squash
draw_sprite_ext(sprite_index,image_index,x,y,esc_x,esc_y,image_angle,c_white,image_alpha);

//mudando o lado com o mouse
if mouse_x < x { image_yscale = -1 }
else { image_yscale = 1 }

//se o jogo não está pausado, o stretch and squash funciona
if !global.pause
{
	if sacada
	{
		esc_x = lerp(esc_x,image_xscale,.2);
		esc_y = lerp(esc_y,image_yscale,.2);
	}
}