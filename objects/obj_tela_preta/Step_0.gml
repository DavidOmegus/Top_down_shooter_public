/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if !global.pause {init = false;}
else { init = true }

if init
{
	alpha = lerp(alpha,.4,.2);
}
else
{
	alpha = lerp(alpha,0,.2);
}

if alpha <= 0 { instance_destroy() }