/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

/*

//PORCENTAGENS
//porcentagem da vida
var _life_percent = (life_atual / life_max) * 100;
//porcentagem de xp
var _xp_percent = (global.xp_atual / global.xp_objetivo) * 100;

//CORES
var _cor_verm = make_color_rgb(255,60,60);

//desenhando a minha barra de vida
if image_xscale == 1
{
	draw_healthbar(x-7,y-9,x+6,y-12,_life_percent,c_black,_cor_verm,_cor_verm,0,1,1);
	draw_healthbar(x-7,y-13,x+6,y-12,_xp_percent,c_black,c_yellow,c_yellow,0,1,1);
}
else if image_xscale == -1
{
	draw_healthbar(x-7,y-9,x+6,y-12,_life_percent,c_black,_cor_verm,_cor_verm,0,1,1);
	draw_healthbar(x-7,y-13,x+6,y-12,_xp_percent,c_black,c_yellow,c_yellow,0,1,1);
}