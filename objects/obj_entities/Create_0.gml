/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//vida das entidades
life_max = 0;
life_atual = life_max;

//verifica se a entidade pode levar dano
leva_dano = true;

esc_x = 1;
esc_y = 1;

spd = 0;
hpsd = 0;
vpsd = 0;
dir = 0;
movendo = false;

//métodos de todas as entidades

alpha_hit_flash = 0;
color_hit_flash = c_white;
tomar_dano = function(_dano)
{
	if leva_dano
	{
		life_atual -= _dano; 
		alpha_hit_flash = 1;
		esc_x = .6;
		esc_y = .6;
		global.screenshake_value = 1;
		if life_atual <= 0 { instance_destroy() }
	}
}