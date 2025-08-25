/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if room = rm_jogo
{
	#region HUD

	#region variaveis sobre o player
	var _player_life_max = 0;
	var _player_life_atual = _player_life_max;
	
	if instance_exists(obj_player)
	{
		_player_life_atual = obj_player.life_atual;
		_player_life_max = obj_player.life_max;
	}
	#endregion
	
	#region variaveis sobre a arma
	var _arma_municao_max = 0;
	var _arma_municao_atual = _arma_municao_max;
	
	if instance_exists(obj_arma_pai)
	{
		_arma_municao_max = obj_arma_pai.municao_max;
		_arma_municao_atual = obj_arma_pai.municao_atual;
	}
	#endregion
	
	//PORCENTAGENS
	//porcentagem da vida
	var _life_percent = (_player_life_atual / _player_life_max) * 100;
	//porcentagem de xp
	var _xp_percent = (global.xp_atual / global.xp_objetivo) * 100;
	//porcentagem de munição
	var _ammo_percent = (_arma_municao_atual/_arma_municao_max) * 100;
	
	//CORES
	var _cor_verm = make_color_rgb(255,60,60);
	var _cor_amarelo = make_color_rgb(255,186,38);
	var _cor_amarelo_esc = make_color_rgb(74,64,41);
	var _cor_azul = make_color_rgb(146,200,222);
	var _cor_azul_esc = make_color_rgb(26,35,38);
	
	//controla o idioma do hud
	var _idioma_control = 0;
	if global.ligua == "ingles" { _idioma_control = 1 }
	else if global.ligua == "portugues" { _idioma_control = 0 }
	
	#region seta
	
	if instance_exists(obj_player) and instance_exists(obj_enemy_pai)
	{
		with obj_player
		{
			var _inimigo_prox	= instance_nearest(x,y,obj_enemy_pai);
			var _dir			= point_direction(x,y,_inimigo_prox.x,_inimigo_prox.y);
			
			if global.seta_pos == "tela"
			{ draw_sprite_ext(spr_seta,0,1200,510,4,4,_dir-90,c_white,global.seta_transp) }
		}
	}
	
	#endregion
	
	#region barras
	
	//barra de vida
	draw_healthbar(9,760,439,706,_life_percent,c_maroon,_cor_verm,_cor_verm,0,true,false);
	
	//barra de xp
	draw_healthbar(172,692,439,703,_xp_percent,_cor_amarelo_esc,_cor_amarelo,_cor_amarelo,0,true,false);
	
	//barra de munição
	draw_healthbar(1320,752,1343,647,_ammo_percent,_cor_azul_esc,_cor_azul,_cor_azul,2,true,false);
	
	#endregion
	
	#region sprites
	
	//desenhando a minha decoração das barras de vida e xp
	draw_sprite_ext(spr_barra_vida_xp,_idioma_control,0,768,4,4,0,c_white,1);
	//desenhando a minha decoração do lugar dos pontos e tempo
	draw_sprite_ext(spr_barra_pontos_tempo,_idioma_control,10,660,4,4,0,c_white,1);
	//desenhando a minha decoração do lugar onde mostra a arma equipada
	if instance_exists(obj_arma_pai)
	{ draw_sprite_ext(spr_cx_arma,0,1294,768,8,8,0,c_white,1); }
	else { draw_sprite_ext(spr_cx_arma,1,1294,768,8,8,0,c_white,1); }
	//desenhando a arma equipada
	if instance_exists(obj_arma_pai) 
	{
		var _arma_skin = obj_arma_pai.minha_skin;
		
		//AVISO: esse erro não tem problema por enquanto...
		if instance_exists(obj_pistol)
			draw_sprite_ext(_arma_skin,0,1160,695,8,8,0,c_white,1);
		else if instance_exists(obj_shotgun)	
			draw_sprite_ext(_arma_skin,0,1160,695,8,8,0,c_white,1);
		else if instance_exists(obj_ak47)		
			draw_sprite_ext(_arma_skin,0,1167,695,8,8,0,c_white,1);
		else if instance_exists(obj_bulldog)	
			draw_sprite_ext(_arma_skin,0,1167,695,8,8,0,c_white,1);
	}
	//desenhando a minha decoração da barra de munição
	draw_sprite_ext(spr_barra_municao,0,1360,768,8,8,0,c_white,1);
	//desenhando o botão "R" se o jogador estiver sem munição
	if instance_exists(obj_arma_pai)
	{
		if _arma_municao_atual == _arma_municao_max
		{ draw_sprite_ext(spr_aviso_recarregar,0,1360,616,4,4,0,c_white,.5) }
		else if _arma_municao_atual < _arma_municao_max and _arma_municao_atual >= 1
		{ draw_sprite_ext(spr_aviso_recarregar,0,1360,616,4,4,0,c_white,1); }
		else if _arma_municao_atual < 1
		{ draw_sprite_ext(spr_aviso_recarregar,1,1360,616,4,4,0,c_white,1); }
	}
	
	#endregion
	
	#region escritas
	
	//definindo a fonte
	draw_set_font(fnt_principal);
	
	//escrevendo a minha vida
	draw_text_transformed(208,710,string(_player_life_atual) + "/" + string(_player_life_max),1,1,0);
	//escrevendo o meu nível
	draw_text(135,670,global.nivel);
	//escrevendo os meus pontos
	draw_text(170,612,global.pontos);
	#region escrevendo a minha munição
	draw_set_halign(1);
	draw_set_valign(1);
		draw_text_ext(1333,697,string(round(_arma_municao_atual)) + "\n-\n" + string(_arma_municao_max),20,20);
	draw_set_valign(-1);
	draw_set_halign(-1);
	#endregion
	#region escrevendo o meu tempo
	var _text_timer_minutos = string(num_timer_hud);
	var _text_timer_segundos = string(round(timer_hud_var/60));
	
	if timer_hud_var < 600 
	{ _text_timer_segundos = "0" + string(round(timer_hud_var/60)); }
	else
	{ string(round(timer_hud_var/60)); }
	
	if num_timer_hud < 10
	{ _text_timer_minutos = "0" + string(num_timer_hud); }
	else
	{ _text_timer_minutos = string(num_timer_hud); }
	
	var _text_time = _text_timer_minutos + ":" + _text_timer_segundos;
	
	draw_text(315,622,_text_time);
	#endregion
	
	//resetando a fonte
	draw_set_font(-1);
	
	#endregion

	#endregion
}

if room != rm_jogo { cursor_sprite = spr_cursor6; }
else { cursor_sprite = spr_cursor1; }