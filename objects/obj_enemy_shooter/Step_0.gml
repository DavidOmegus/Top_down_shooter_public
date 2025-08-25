/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();



if !global.pause
{
	image_speed = 1;
	//sigo o player, se ele existir, se não, eu vago por ai
	if instance_exists(obj_player) 
	{
		if distance_to_object(obj_player) < random_range(75,100) 
		{ 
			randomize();
			if tiro_timer_atual <= 0
			{
				atirar()
				if sprite_index == spr_enemy or sprite_index == spr_enemy_buff
				{tiro_timer_atual = tiro_timer_max;}
			} else {
				tiro_timer_atual--;
				image_speed = 0;
				spd = 0;
			}
		}
		else 
		{ 
			spd = spd_save;
			seguir_player(); 
			image_speed = 1;
		}	
	}
	else { vagar_por_ai() }
	
	var _pos = pivot.atualiza_pos();
	if image_index == 2 or image_index == 3
	{
		instance_create_layer(x + _pos.x,y + _pos.y,"pegada_inimigos",obj_pegada);
	}
}
else
{
	image_speed = 0;
}