/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

if life_atual > life_max { life_atual = life_max }

switch estado
{
	case "livre": {
		
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
			//define direção do dash como o mouse
			dash_dir = point_direction(x,y,mouse_x,mouse_y);
			estado = "dash"; 
		}
		
	}
	
	case "dash": {
		estado_dash();
	}
}
