/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

randomize();

//vida do inimigo
life_max = 3;
life_atual = life_max;

//dano do inimigo
dano = 1;

//velocidade do inimigo
spd = random_range(.9,1.5);
push = spd;

//criando novo pivot
pivot = new Pivot(15,25);

//verifica se recebeu dano crítico
receber_dano_critico = false;
//porcentagem para o crítico
critico_chance = 5;
//será o número para o crítico
critico_teste = 0;

//buff
is_buffed = false;
buff_chance = 0;
buff_teste = 0;

//métodos inimigo

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

//vagando
direcao_setada = false;
vagar_por_ai = function()
{
	if !direcao_setada
	{
		dir = point_direction(x,y,random(room_width),random(room_height));
		direcao_setada = true;
	}
	
	// Atualiza a posição do inimigo para a direção
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
	
	if		dir < room_width / 2 and !is_buffed	{ image_xscale = -1 }
	else if	dir > room_width / 2 and !is_buffed	{ image_xscale = 1  }
	else if dir < room_width / 2 and is_buffed	{ image_xscale = -2}
	else if dir > room_width / 2 and is_buffed	{ image_xscale = 2 }
}

//quantidade de pontos que posso dar
dar_pontos = function(_v_min,_v_max)
{
	var _pontos_qnt = irandom_range(_v_min,_v_max);
	return _pontos_qnt;
}
pontos = dar_pontos(1,10);

dar_xp = function()
{
	global.xp_atual++;
}

buff = function()
{
	is_buffed = true;
	sprite_index = spr_enemy_buff;
	
	life_max = 20;
	life_atual = life_max;
	
	spd *= .75;
}

//rework do dano
tomar_dano = function(_dano)
{
	if leva_dano
	{
		life_atual -= _dano; 
		alpha_hit_flash = 1;
		
		if instance_exists(obj_player)
		{
			if		 is_buffed and x > obj_player.x {esc_x = -1.6;	esc_y	= 1.6;}
			else if !is_buffed and x > obj_player.x {esc_x = -.6;	esc_y	= .6 ;}
			else if  is_buffed and x < obj_player.x {esc_x =  1.6;	esc_y	= 1.6;}
			else if !is_buffed and x < obj_player.x {esc_x =  .6;	esc_y	= .6 ;}
		}
		
		global.screenshake_value = 1;
		if life_atual <= 0 
		{ 
			buff_teste = random_range(1,100);
			if buff_teste < buff_chance and !is_buffed {buff();}
			else {instance_destroy();}
		}
	}
}