/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

valor = global.seta_transp

switch valor
{
	case 1:		sprite_ing =	spr_botao_transp_seta_100; 
				sprite_port =	spr_botao_transp_seta_100;	
				break;
				
	case .75:	sprite_ing =	spr_botao_transp_seta_75; 
				sprite_port =	spr_botao_transp_seta_75;	
				break;
				
	case .5:	sprite_ing =	spr_botao_transp_seta_50; 
				sprite_port =	spr_botao_transp_seta_50;	
				break;
				
	case .25:	sprite_ing =	spr_botao_transp_seta_25; 
				sprite_port =	spr_botao_transp_seta_25;	
				break;
				
	case 0:		sprite_ing =	spr_botao_transp_seta_0_off;
				sprite_port =	spr_botao_transp_seta_0_off;	
				break;
}