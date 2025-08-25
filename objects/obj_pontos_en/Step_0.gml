/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if !global.pause
{
	image_xscale = tam;
	image_yscale = tam;
	tam -= .01;
	
	if tam <= 0 { instance_destroy() } 
}