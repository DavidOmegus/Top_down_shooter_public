/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

seguir = false;

spd_save = spd;

//métodos inimigo

tiro_timer_max = 90;
tiro_timer_atual = 0;
atirar = function()
{
	spd = 0;
	sprite_index = spr_enemy_atira;
	if is_buffed { sprite_index = spr_enemy_atira_buff }
	
	if (sprite_index == spr_enemy_atira and image_index > image_number - 1)
	{
		var bullet = instance_create_layer(x,y,layer,obj_enemy_shoot);
		bullet.speed = 2;
		if is_buffed {bullet.image_xscale = 2; bullet.image_yscale = 2}
		if instance_exists(obj_player)
		{
			bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
		} else {
			instance_destroy(bullet);
		}
		sprite_index = spr_enemy
	} 
	else if (sprite_index == spr_enemy_atira_buff and image_index > image_number - 1)
	{
		var bullet = instance_create_layer(x,y,layer,obj_enemy_shoot);
		bullet.speed = 1.5;
		bullet.image_xscale = 2; 
		bullet.image_yscale = 2
		if instance_exists(obj_player)
		{
			bullet.direction = point_direction(x,y,obj_player.x,obj_player.y);
		} else {
			instance_destroy(bullet);
		}
		sprite_index = spr_enemy_buff;
		
	} 
	//fazer o inimigo soltar o tiro no último frame
	//fazer particulas de explosão em um frame específico
}


//seguindo o player
seguir_player = function()
{
	// Posição do jogador
	var player_x = obj_player.x;
	var player_y = obj_player.y;
	
	// Distância em x e y entre o inimigo e o jogador
	var dist_x = player_x - x;
	var dist_y = player_y - y;
	
	// Ângulo em direção ao jogador
	dir = point_direction(x, y, player_x, player_y);
	
	// Atualiza a posição do inimigo em direção ao jogador
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}