/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

//se o jogo não está pausado...
if !global.pause
	{
		
	//movimentando
	movimentacao();
	
	//sacando a arma
	saca_arma();
	
	//temporizando para o player poder tomar dano novamente
	if !leva_dano
	{
		timer_inv_atual--;
		if timer_inv_atual <= 0 { leva_dano = true; timer_inv_atual = timer_inv_total; }
	}
	
	if life_atual > life_max { life_atual = life_max }
}
else
{
	image_speed = 0;
}

