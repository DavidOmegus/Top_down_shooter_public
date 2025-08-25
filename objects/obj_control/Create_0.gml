/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

randomize();

#region musica

//se a global.music tá ativada, o jogo tem música, caso contrário, não
if global.music and room == rm_jogo
	audio_play_sound(snd_musica_2,1,true,global.music_volume);

#endregion

//variáveis

global.pause = false;
is_pause = false;

//deixa um tempinho depois que o jogador morreu para o jogo reiniciar
timer_enemies_max = 150;
timer_enemies_atual = timer_enemies_max;
global.player_dead = false;
timer_player_death = 120;

//métodos

spawn_enemy = function()
{
	//cria o sinal de inimigo
	instance_create_layer(random(room_width),random(room_height),"inimigos",obj_sinal);
}

pausar = function()
{
	if room != rm_pause and room != rm_menu_inicio and room != rm_options
	{
		if instance_exists(obj_player)
		{
			obj_player.persistent = false;
			is_pause = true;
			instance_activate_all();
		}
		
		room_previous(room);
		room_goto(rm_pause);
		
	} else {
		
		if room == rm_jogo or room == rm_pause
		{
			
			room_goto_previous();
			instance_deactivate_all(true);
			
		}
	}
	
}

num_timer_hud = 0;
timer_hud_var = 0
timer_hud = function()
{
	//um minuto
	if timer_hud_var > 3598
	{
		num_timer_hud++;
		timer_hud_var = 0;
	}
	else
	{
		timer_hud_var++;
	}
}