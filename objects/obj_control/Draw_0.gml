/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if room == rm_jogo
{
	#region seta
	
	if instance_exists(obj_player) and instance_exists(obj_enemy_pai)
	{
		with obj_player
		{
			var _inimigo_prox	= instance_nearest(mouse_x,mouse_y,obj_enemy_pai);
			var _dir			= point_direction(mouse_x,mouse_y,_inimigo_prox.x,_inimigo_prox.y);
			
			if global.seta_pos == "cursor"
			{ draw_sprite_ext(spr_seta,0,mouse_x,mouse_y,.4,.4,_dir-90,c_white,global.seta_transp) }
		}
	}
	
	#endregion
}