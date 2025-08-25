/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

//barulho de morte
audio_play_sound(snd_morte_en,90,false,global.sfx_volume);

//se não recebo dano crítico, dou quantidade normal de pontos e dano
if !receber_dano_critico
{
	global.pontos += pontos;
	var text = instance_create_layer(x,y,layer,obj_pontos_en);
	text.text = string(pontos);
	dar_xp();
}
//se recebo crítico, dou o dobro de pontos e morro direto
else if receber_dano_critico and !is_buffed
{
	global.pontos += pontos*2;
	var text = instance_create_layer(x,y,layer,obj_pontos_en);
	text.text = string(pontos*2) + "\nCRIT!";
	dar_xp(); dar_xp();
}
else if is_buffed
{
	global.pontos += pontos*2;
	var text = instance_create_layer(x,y,layer,obj_pontos_en);
	text.text = string(pontos*2) + "\nGIGA!";
	dar_xp(); dar_xp();
}