/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

//image_xscale = .8;
//image_yscale = .8;

pivot = new Pivot(22,18); 
tiro_rajada_var = true;
municao_max = 20;
municao_atual = municao_max;
recarga_num = .2;
timer_tiro_max = 5;
minha_bala = obj_bala_bulldog;
minha_skin = spr_bulldog_off;

tiro_rajada = function()
{
	//posição do pivot
	var _pos = pivot.atualiza_pos();
	
	//criando o meu tiro no pivot
	if mouse_x > x
		var _tiro = instance_create_layer(x + _pos.x,y + _pos.y - .5,"tiro",minha_bala);
	else
		var _tiro = instance_create_layer(x + _pos.x,y + _pos.y - 4.5,"tiro",minha_bala);
	
	//definindo a direção do meu tiro
	_tiro.direction = direction;
	_tiro.image_angle = direction;
	
	//stretch and squash
	esc_x = .7;
	if mouse_x > x { esc_y = .7 }
	else { esc_y = -.7 }
	
	//reduzindo a munição
	municao_atual -= 1;
}

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
						tiro_rajada();
						_contador_rajada++;
					}
					else if mouse_check_button_pressed(mb_left)
					{
						tiro_rajada();
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