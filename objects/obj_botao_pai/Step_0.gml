/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

image_alpha = alpha;

if mouse_dentro
{
	alpha = lerp(alpha,1,.2);
	image_speed = 1;
}
else
{
	alpha = lerp(alpha,.7,.2);
	image_speed = 0;
	image_index = 0;
}

if bt_jogar_var
{
	if delay_atual <= 0
	{
		bt_jogar();
	}
	else
	{
		delay_atual--;
	}
}

if bt_config_var
{
	if delay_atual <= 0
	{
		bt_config();
	}
	else
	{
		delay_atual--;
	}
}

if bt_sair_var
{
	if delay_atual <= 0
	{
		bt_sair();
	}
	else
	{
		delay_atual--;
	}
}

if bt_music_var and global.music
{
	if global.ligua == "ingles" and !bt_music_peq
	{ sprite_ing = spr_botao_music_on }
	else if global.ligua == "portugues" and !bt_music_peq
	{ sprite_port = spr_botao_musica_lig }
	else if global.ligua == "ingles" and bt_music_peq
	{ sprite_ing = spr_botao_music_peq_lig }
	else if global.ligua == "portugues" and bt_music_peq
	{ sprite_port = spr_botao_music_peq_lig }
}
else if bt_music_var and !global.music
{
	if global.ligua == "ingles" and !bt_music_peq
	{ sprite_ing = spr_botao_music_off }
	else if global.ligua == "portugues" and !bt_music_peq
	{ sprite_port = spr_botao_musica_desl }
	else if global.ligua == "ingles" and bt_music_peq
	{ sprite_ing = spr_botao_music_peq_desl }
	else if global.ligua == "portugues" and bt_music_peq
	{ sprite_port = spr_botao_music_peq_desl }
}

if bt_voltar_var
{
	if delay_atual <= 0
	{
		bt_voltar();
	}
	else
	{
		delay_atual--;
	}
}

if bt_menu_var
{
	if delay_atual <= 0
	{
		bt_menu();
	}
	else
	{
		delay_atual--;
	}
}

if bt_continuar_var
{
	if delay_atual <= 0
	{
		bt_continuar();
	}
	else
	{
		delay_atual--;
	}
}

if bt_seta_transp_var
{
	if delay_atual <= 0
	{
		bt_seta_transp();
		bt_seta_transp_var = false;
	}
	else
	{
		delay_atual--;
	}
}

if bt_seta_pos_var
{
	if delay_atual <= 0
	{
		bt_seta_pos();
		bt_seta_pos_var = false;
	}
	else
	{
		delay_atual--;
	}
}

if global.ligua == "ingles" 
{ 
	sprite_index = sprite_ing;
}
else if global.ligua == "portugues" 
{ 
	sprite_index = sprite_port;
}