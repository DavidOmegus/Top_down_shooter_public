/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//botão para pausar (ESC)
if keyboard_check_pressed(vk_escape) { pausar() }

//sobre musica
if room == rm_menu_inicio 
{ 
	if audio_is_playing(snd_musica_2) { audio_stop_sound(snd_musica_2) }
	if global.music and !audio_is_playing(snd_musica_menu) 
	{ audio_play_sound(snd_musica_menu,2,true,global.music_volume/2) }
}
else if room == rm_pause 
{
	if audio_is_playing(snd_musica_2) { audio_pause_sound(snd_musica_2) }
	if global.music and !audio_is_playing(snd_musica_menu) 
	{ audio_play_sound(snd_musica_menu,2,true,global.music_volume/2) }
}
else if room == rm_jogo 
{
	//continuando a música, se ela foi pausada
	if audio_is_paused(snd_musica_2) 
	{ audio_resume_sound(snd_musica_2); }
	
	if !audio_is_playing(snd_musica_2) and global.music
	{ audio_play_sound(snd_musica_2,1,true,global.music_volume) }
	else if !global.music { audio_stop_sound(snd_musica_2) }
	
	if audio_is_playing(snd_musica_menu) {audio_stop_sound(snd_musica_menu)}
}
//menu & opções
else if !global.music and audio_is_playing(snd_musica_menu)
	{ audio_stop_sound(snd_musica_menu) }

if !global.pause
{
	if room == rm_jogo
	{
		//timer para spawnar o inimigo, somente se estiver na room do jogo
		if room == rm_jogo
		{
			timer_enemies_atual--;
			if timer_enemies_atual <= 0 
			{ spawn_enemy(); timer_enemies_atual = timer_enemies_max }
			
			if global.pontos >= global.pontos_objetivo and timer_enemies_max > 45
			{ timer_enemies_max -= 15; global.pontos_objetivo += 100; }
		}
		
		//timer para o jogo reiniciar após a morte do player
		if global.player_dead
		{
			timer_player_death--;
			if timer_player_death <= 0 {reset_pontos(); reset_xp(); game_restart(); }
		}
		
		timer_hud();
	
	}
}
else
{
	//se o jogo tá pausado, a música também fica pausada
	if audio_is_playing(snd_musica_2) { audio_pause_sound(snd_musica_2) }
}

//player pode subir de nível
level_up();