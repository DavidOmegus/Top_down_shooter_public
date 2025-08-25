/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//barulho de ser sacada/criada
audio_play_sound(snd_saca_arma,100,false,global.sfx_volume);

//varíaveis para o tamanho e stretch and squash
esc_x = 1;
esc_y = 1;

minha_skin = noone;

//cria um novo pivot
pivot = new Pivot(0,0); 

//variáveis para ver qual tipo de tiro a minha arma solta
minha_bala = noone;

tiro_unico_var = false;
tiro_espalhado_var = false;
tiro_rajada_var = false;

//se for guardada (sacada = false), ele faz um efeito antes de destruí-la
sacada = true;
pode_guardar = true;
guardar = function()
{
	if !sacada and pode_guardar
	{
		//barulho
		audio_play_sound(snd_guarda_arma,50,false,global.sfx_volume);
		//rotação
		image_angle += 4;
		//tamanho
		esc_x -= .05 * image_xscale;
		esc_y -= .05 * image_xscale;
		//me destruindo se algum dos esc's for abaixo de 0
		if esc_x <= 0 and esc_y <= 0 { instance_destroy() }
	}
}

//distancia que eu fico do pivot do player
dist_value_x = 0;
dist_value_y = 0;
dist_x = dist_value_x;
dist_y = dist_value_y;
acompanha_player = function()
{
	//se o player existe...
	if instance_exists(obj_player)
	{
		//me posicionando
		dist_x = dist_value_x * obj_player.image_xscale;
		dist_y = dist_value_y * obj_player.image_yscale;
		
		//acompanhando o player
		x = obj_player.x + dist_x;
		y = obj_player.y + dist_y;
	}
}
acompanha_mouse = function()
{
	//se a arma tá sacada ela segue a direção do mouse
	if sacada
	{
		direction = point_direction(x,y,mouse_x,mouse_y);
		image_angle = direction;
	}
}

//minha munição
municao_max = 0;
municao_atual = municao_max;

//verificando se posso atirar
pode_atirar = true;
timer_tiro_max = 0;
timer_tiro_atual = 0;

_contador_rajada = 0;
_timer_rajada = 1;

//verifica se já atirei
atirou = false;
atira = function()
{
	//se eu apertar o botão esquerdo mouse, tiver ao menos de 1 munição e poder atirar
	if municao_atual >= 1 and pode_atirar
	{
		//se estou segurando o botão
		if mouse_check_button(mb_left) 
		{
			//se o meu timer tiver rodado
			if timer_tiro_atual <= 0
			{
				//crio o tiro único, ou o espelhado
				if tiro_unico_var { tiro_unico(minha_bala) }
				else if tiro_espalhado_var { tiro_espalhado(minha_bala) }
				//fazendo o tiro de rajada
				else if tiro_rajada_var 
				{ 
					if _contador_rajada < 3
					{
						tiro_rajada(minha_bala);
						_contador_rajada++;
					}
					else if mouse_check_button_pressed(mb_left)
					{
						tiro_rajada(minha_bala);
					}
					else
					{
						_timer_rajada--;
						if _timer_rajada <= 0
						{ _contador_rajada = 0; _timer_rajada = 2 }
					}
				}
				
				timer_tiro_atual = timer_tiro_max;
			}
			//se o meu timer não é 0, reduzo ele enquanto estou com o botão apertado
			else
			{
				timer_tiro_atual--;
			}
		}
		//se não estou apertando o botão do mouse, o timer fica 0
		else
		{
			//timer_tiro_atual = 0;
			timer_tiro_atual--;
		}
	}
}

tiro_unico = function(_objeto)
{
	//posição do pivot
	var _pos = pivot.atualiza_pos();
	
	//criando o meu tiro no pivot
	if mouse_x > x
		var _tiro = instance_create_layer(x + _pos.x,y + _pos.y - .5,"tiro",_objeto);
	else
		var _tiro = instance_create_layer(x + _pos.x,y + _pos.y - 4.5,"tiro",_objeto);

	//definindo a direção do meu tiro
	_tiro.direction = direction;
	_tiro.image_angle = direction;
	
	//stretch and squash
	esc_x = .8;
	if mouse_x > x { esc_y = .8 }
	else { esc_y = -.8 }
	
	//reduzindo a munição
	municao_atual--;
}
tiro_espalhado = function(_objeto)
{
	//posição do pivot
	var _pos = pivot.atualiza_pos();
	
	#region tiro que vai mais pra cima
	
	//criando meu tiro no pivot
	if mouse_x > x
		var _tiro_1 = instance_create_layer(x + _pos.x,y + _pos.y - .5,"tiro",_objeto);
	else
		var _tiro_1 = instance_create_layer(x + _pos.x,y + _pos.y - 4.5,"tiro",_objeto);
	
	//definindo a direção do meu tiro
	_tiro_1.direction = direction + 10;
	_tiro_1.image_angle = _tiro_1.direction;
	
	#endregion
	
	#region tiro que vai mais reto
	
	//criando meu tiro no pivot
	if mouse_x > x
		var _tiro_2 = instance_create_layer(x + _pos.x,y + _pos.y - .5,"tiro",_objeto);
	else
		var _tiro_2 = instance_create_layer(x + _pos.x,y + _pos.y - 4.5,"tiro",_objeto);
	
	//definindo a direção do meu tiro
	_tiro_2.direction = direction;
	_tiro_2.image_angle = _tiro_2.direction;
	
	#endregion
	
	#region tiro que vai mais para baixo
	
	//criando meu tiro no pivot
	if mouse_x > x
		var _tiro_3 = instance_create_layer(x + _pos.x,y + _pos.y - .5,"tiro",_objeto);
	else
		var _tiro_3 = instance_create_layer(x + _pos.x,y + _pos.y - 4.5,"tiro",_objeto);
	
	//definindo a direção do meu tiro
	_tiro_3.direction = direction - 10; 
	_tiro_3.image_angle = _tiro_3.direction;
	
	#endregion
	
	//stretch and squash
	esc_x = .8;
	if mouse_x > x { esc_y = .8 }
	else { esc_y = -.8 }
	
	//reduzindo a munição
	municao_atual--;
}
tiro_rajada = function(_objeto)
{
	//posição do pivot
	var _pos = pivot.atualiza_pos();
	
	//criando o meu tiro no pivot
	if mouse_x > x
		var _tiro = instance_create_layer(x + _pos.x,y + _pos.y - .5,"tiro",_objeto);
	else
		var _tiro = instance_create_layer(x + _pos.x,y + _pos.y - 2.5,"tiro",_objeto);
	
	//definindo a direção do meu tiro
	_tiro.direction = direction;
	_tiro.image_angle = direction;
	_tiro.dano = .8;
	
	//stretch and squash
	esc_x = .7;
	if mouse_x > x { esc_y = .7 }
	else { esc_y = -.7 }
	
	//reduzindo a munição
	municao_atual -= 1;
}

//verifica se estou recarregando
recarregando = false;
//velocidade de recarregar (usar valores abaixo de 0.2)
recarga_num = 0;
//se não estou recarregando e o som de recarregar existe, paro ele
if !recarregando 
{ if audio_exists(snd_recarrega) audio_stop_sound(snd_recarrega) }
//método para recarregar a munição
recarrega = function()
{
	//se eu tiver menos que o meu máximo munição, posso recarregar
	if municao_atual < municao_max
	{
		//definindo os limites da minha munição atual
		municao_atual = clamp(municao_atual,0,municao_max);
		
		//se apertar R, começo a recarregar e toco o barulho
		if keyboard_check_pressed(ord("R")) {recarregando = true; audio_play_sound(snd_recarrega,50,false,global.sfx_volume);}
		
		//se estou recarregando
		if recarregando 
		{
			//vou aumentando a minha munição
			municao_atual += recarga_num; 
			//não posso atirar enquanto recarrego
			pode_atirar = false; 
		}
		
		//se a minha munição atual é maior ou igual a 
		//minha munição maxima - 0.05, eu não estou mais recarregando,
		//posso atirar e a minha munição atual é igual a minha maxima
													 //(ninguém percebe)
		if municao_atual >= municao_max-.05 
		{ recarregando = false; pode_atirar = true; municao_atual = municao_max }
	}
}


