/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if !global.pause
{
	//Step
	//enquanto estiver na room, treme a tela
	shake(global.screenshake_value);
	
	//definindo o valor do balanço/shake
	global.screenshake_value *= 0.965;
}