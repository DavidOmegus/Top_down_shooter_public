/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if !global.pause
{
	speed = 5;
	
	life_time--;
	
	if life_time <= 0 { instance_destroy() }
}
else
{
	speed = 0;
}