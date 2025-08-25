/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//se o jogo não está pausado, executo tudo normalmente
if !global.pause
{
	if !pode_guardar { sacada = true }
	if municao_atual < municao_max { pode_guardar = false }
	else if municao_atual >= municao_max { pode_guardar = true }
	
	acompanha_player();
	acompanha_mouse();
	atira();
	recarrega();
	guardar();
	
	if !instance_exists(obj_player) {instance_destroy()}
}