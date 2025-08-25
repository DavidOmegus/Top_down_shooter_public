/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

texto = "sample";
cor = c_white;
alpha = 1;
mouse_dentro = false;
image_speed = 0;
delay_max = 15;
delay_atual = delay_max;

esc_x = .5;
esc_y = .5;

sprite_ing = sprite_index;
sprite_port = sprite_index;

bt_jogar_var = false;
bt_jogar = function() {room_goto(rm_jogo);}

bt_config_var = false;
bt_config = function() { room_goto(rm_options); }

bt_sair_var = false;
bt_sair = function() { game_end() }

bt_music_var = false;
bt_music_peq = false;
bt_music = function() { global.music = !global.music }

bt_voltar_var = false;
bt_voltar_dest = rm_menu_inicio;
bt_voltar = function() { room_goto(bt_voltar_dest) }

bt_idioma_var = false;
bt_idioma_min = 0;
bt_idioma_max = 1;
bt_idioma_atual = 0;
bt_idioma = function()
{	
	bt_idioma_atual++;
	if bt_idioma_atual > bt_idioma_max
	{ bt_idioma_atual = bt_idioma_min }
	
	switch bt_idioma_atual
	{
		case 0: 
			global.ligua = "ingles"; 
			break;
		case 1: 
			global.ligua = "portugues"; 
			break;
	}
}

bt_menu_var = false;
bt_menu = function() { room_goto(rm_menu_inicio); game_restart(); }

bt_continuar_var = false;
bt_continuar = function() 
{ 
	obj_control.pausar();
}

bt_seta_transp_var = false;
bt_seta_transp = function()
{
	if global.seta_transp > 0
		{global.seta_transp -= 0.25;}
	else global.seta_transp = 1;
}

bt_seta_pos_var = false;
bt_seta_pos = function()
{
	if global.seta_pos == "cursor" { global.seta_pos = "tela" }
	else if global.seta_pos == "tela" { global.seta_pos = "cursor" }
}
