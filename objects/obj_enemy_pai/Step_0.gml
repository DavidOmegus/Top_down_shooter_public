/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

//se o jogo não está pausado...
if !global.pause
{
	image_speed = 1;
	//sigo o player, se ele existir, se não, eu vago por ai
	if instance_exists(obj_player) {seguir_player();}
	else { vagar_por_ai() }
	
	var _pos = pivot.atualiza_pos();
	if image_index == 2 or image_index == 3
	{
		instance_create_layer(x + _pos.x,y + _pos.y,"pegada_inimigos",obj_pegada);
	}
}
else
{
	image_speed = 0;
}

/*
if(global.pontos<=200)
    buff_chance = 0
else if(global.pontos<=1000)
    buff_chance = (global.pontos/19)-(200/19)
else
    buff_chance = 100
*/

if      global.pontos	> 200 { buff_chance = 5  }
else if global.pontos	> 300 { buff_chance = 10 }
else if global.pontos	> 400 { buff_chance = 15 }
else if global.pontos	> 500 { buff_chance = 20 }
else if global.pontos	> 600 { buff_chance = 25 }
else if global.pontos	> 700 { buff_chance = 30 }
else if global.pontos	> 800 { buff_chance = 35 }
else if global.pontos	> 900 { buff_chance = 40 }
else if global.pontos	> 1000 { buff_chance = 45 }
else if global.pontos	> 1100 { buff_chance = 50 }
else if global.pontos	> 1200 { buff_chance = 55 }
else if global.pontos	> 1300 { buff_chance = 60 }
else if global.pontos	> 1400 { buff_chance = 65 }
else if global.pontos	> 1500 { buff_chance = 70 }
else if global.pontos	> 1600 { buff_chance = 75 }
else if global.pontos	> 1700 { buff_chance = 80 }
else if global.pontos	> 1800 { buff_chance = 85 }
else if global.pontos	> 1900 { buff_chance = 90 }
else if global.pontos	> 2000 { buff_chance = 95 }
else if global.pontos	> 2100 { buff_chance = 100 }