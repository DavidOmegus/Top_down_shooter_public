/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_sprite_ext(sprite_index,image_index,x,y,esc_x,esc_y,image_angle,c_white,image_alpha);

//hit flash
if alpha_hit_flash > 0
{

	gpu_set_fog(true,color_hit_flash,0,0);
	
	if image_xscale == 1
		draw_sprite_ext(sprite_index,image_index,x,y,esc_x,esc_y,0,c_white,alpha_hit_flash);
	else if image_xscale == -1
		draw_sprite_ext(sprite_index,image_index,x,y,esc_x,esc_y,0,c_white,alpha_hit_flash);
	
	gpu_set_fog(false,color_hit_flash,0,0);

}

esc_x = lerp(esc_x,image_xscale,.2);
esc_y = lerp(esc_y,image_yscale,.2);