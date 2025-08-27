/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

if life_atual > life_max { life_atual = life_max }

switch estado
{
	case "livre": 
		
		hspd = 0;
		vspd = 0;
		estado_livre();
		
		//Para dar o dash, deve apertar o shift, ter a habilidade do dash e poder dar
		//o dash
		if keyboard_check_pressed(vk_shift) and dash and can_dash
		{ 
			//desativa o dash para o delay
			can_dash = false;
			//conta o delay para poder dar dash de novo
			alarm[0] = dash_delay;
			hspd = 0;
			vspd = 0;
			
			var _direita_dash = keyboard_check(ord("D"));
			var _esquerda_dash = keyboard_check(ord("A"));
			var _cima_dash = keyboard_check(ord("W"));
			var _baixo_dash = keyboard_check(ord("S"));
			//Retas
			if _direita_dash 				{ dash_dir = 0 }
			else if _esquerda_dash	{ dash_dir = 180 }
			else if _cima_dash			{ dash_dir = 90 }
			else if _baixo_dash			{ dash_dir = 270 }
			//Diagonais
			if _direita_dash and _cima_dash				{ dash_dir = 45 }
			else if _direita_dash and _baixo_dash		{ dash_dir =315}
			else if _esquerda_dash and _cima_dash	{ dash_dir = 135 }
			else if _esquerda_dash and _baixo_dash	{ dash_dir =225 }
			//Se nenhum botão de movimento estiver sendo pressionado
			//define direção do dash como o mouse
			if !_direita_dash and !_esquerda_dash and !_cima_dash and !_baixo_dash
			{ dash_dir = point_direction(x,y,mouse_x,mouse_y); }
			estado = "dash"; 
			//som do dash
			audio_play_sound(snd_dash,50,0,global.sfx_volume);
		}
		break;
	
	case "dash":
		
		estado_dash();
		break;
}
