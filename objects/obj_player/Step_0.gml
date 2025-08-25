/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

if life_atual > life_max { life_atual = life_max }

switch estado
{
	case "livre": {
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
		
		if keyboard_check_pressed(vk_shift) { estado = "dash" }
	}
	
	case "dash": {
		
	}
}
