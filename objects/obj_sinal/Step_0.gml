/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if !global.pause
{
	timer--;
	
	if timer <= 0 { instance_destroy() }
	
	if image_index == 0 and distance_to_object(obj_player) < 100 
	{ audio_play_sound(snd_sinal,100,false,global.sfx_volume) }
	
	if inimigo_seletor > 85 {inimigo = obj_enemy_shooter}
	else {inimigo = obj_enemy_pai}
}