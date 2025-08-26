/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited();
//vida do player
life_max = 10;
life_atual = life_max;

//Velocidade
spd = 1;
hspd = 0;
vspd = 0;
dir = 0;

//Estado
estado = "livre";

//tempo de invencibilidade
timer_inv_total = 45;
timer_inv_atual = timer_inv_total;

#region métodos do player

//método de movimentação
movimentacao = function()
{
	//variávis de movimentos
	var _direita = keyboard_check(ord("D"));
	var _esquerda = keyboard_check(ord("A"));
	var _cima = keyboard_check(ord("W"));
	var _baixo = keyboard_check(ord("S"));
	var _move = _cima xor _baixo or _direita xor _esquerda
	
	//diminuindo a minha velocidade com base na minha arma atual
	/*andando com a Shotgun*/ if instance_exists(obj_shotgun)		 { spd = 1.5 }
	/*andando com a Pistola*/ else if instance_exists(obj_pistol)		 { spd = 1.8 }
	/*andando com a Bulldog*/ else if instance_exists(obj_bulldog)	 { spd = 1.65 }
	/*andando com a AK*/ else if instance_exists(obj_ak47)		 { spd = 1.5 }
	/*nada*/ else { spd = 2 }
	
	//movendo usando o teclado
	if _move
	{
		//movimentação "antiga"
		
		dir = point_direction(0,0,(_direita - _esquerda),(_baixo - _cima));
		
		hspd = lengthdir_x(spd,dir);
		vspd = lengthdir_y(spd,dir);
		
		x += hspd;
		y += vspd;
		
		image_speed = 1;
		movendo = true;
	}
	else { image_speed = 0; image_index = 0; movendo = false }
	
	//barulho dos passos
	if image_index == 1 or image_index == 3 { audio_play_sound(snd_andando,90,false,global.sfx_volume) }
	
	//prendendo dentro da room
	x = clamp(x,0,room_width);
	y = clamp(y,0,room_height);
	
	//olhando para o lado do mouse enquanto está parado
	if mouse_x < x { image_xscale = -1; } else { image_xscale = 1 }
}

//método que cria a arma
saca_arma = function()
{
	//variável para a arma
	var _arma;
	
	//o tipo da minha arma é aleatório, podendo ser uma shotgun ou pistola
	var _arma_tipo = choose(obj_pistol,obj_shotgun,obj_bulldog,obj_ak47);
	
	//aperto E para sacar a arma
	var _saca_arma = keyboard_check_pressed(ord("E"));
	randomize();
	
	//se o botão E for apertado, cria a arma, se ela já existir, destroi
	if _saca_arma 
	{
		//se a arma já não existe, cria ela, ou seja, escolhe uma das armas
		if !instance_exists(obj_arma_pai)
		{
			//criando a minha arma
			_arma = instance_create_layer(x,y,"arma",_arma_tipo);
			
			//definindo a posição da arma no player
			if _arma_tipo == obj_shotgun
			{
				_arma.dist_value_x = 0;
				_arma.dist_value_y = 3;
			}
			else if _arma_tipo == obj_pistol
			{
				_arma.dist_value_x = 4;
				_arma.dist_value_y = 3;
			}
			else if _arma_tipo == obj_bulldog
			{
				_arma.dist_value_x = 0;
				_arma.dist_value_y = 3;
			}
			else if _arma_tipo == obj_ak47
			{
				_arma.dist_value_x = 0;
				_arma.dist_value_y = 3;
			}
			
			//ativando variável da arma
			_arma.sacada = true;
		}
		//se a arma já existe, "guarda ela"
		else { with obj_arma_pai sacada = false }
	}
}

//reescrevendo o método de tomar dano
tomar_dano = function(_dano)
{
	//se posso levar dano...
	if leva_dano
	{
		//perco vida
		life_atual -= _dano;
		//ativo o hit flash
		alpha_hit_flash = 1;
		//strecth and squash
		esc_x = .6;
		esc_y = .6;
		//tremendo a tela
		global.screenshake_value = 3;
		//não podendo mais levar dano
		leva_dano = false;
		//criando o barulho de dano
		audio_play_sound(snd_leva_dano_player,100,false,global.sfx_volume);
		//me destruo e crio um inimigo novo se chegar a 0 ou menos de vida
		if life_atual <= 0 
		{ instance_create_layer(x,y,"inimigos",obj_enemy_pai); instance_destroy(); }
	}
}

#endregion

#region estados do player

// - Livre
estado_livre = function()
{
	
	//movimentando
		movimentacao();
		
		//sacando a arma
		saca_arma();
		
		//temporizando para o player poder tomar dano novamente
		if !leva_dano
		{
			timer_inv_atual--;
			if timer_inv_atual <= 0 { leva_dano = true; timer_inv_atual = timer_inv_total; }
		}
}

// - Dash

//variaveis do dash
dash = true;
can_dash = true;
dash_delay_sec = .5;
dash_delay = 60 * dash_delay_sec; //Não alterar\\
dash_dir = 0;
dash_power = 5;	
dash_time = 0;
dash_distance = 8;

estado_dash = function()
{
	//invulnerável durante o dash
	leva_dano = false;
	
	//atualiza a distancia do dash
	dash_distance = 7 + global.nivel;
	
	//Dash
	hspd = lengthdir_x(dash_power,dash_dir);
	vspd = lengthdir_y(dash_power,dash_dir);
	
	//Duração do dash
	dash_time++;
	if dash_time >= dash_distance 
	{
		//Acabou o dash, volta para o estado livre
		dash_time = 0;
		hspd = 0;
		vspd = 0;
		leva_dano = true;
		estado = "livre";
	}
	
	x += hspd;
	y += vspd;
}

#endregion