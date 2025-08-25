//XP
global.nivel = 1;
global.xp_atual = 0;
global.xp_objetivo = 10;

function level_up()
{	
	if global.xp_atual >= global.xp_objetivo 
	{ 
		global.nivel++; 
		global.xp_atual = 0; 
		global.xp_objetivo += 5;
		
		audio_play_sound(snd_level_up,100,false);
		
		if instance_exists(obj_player)
		{
			with obj_player
			{
				life_max++;
				life_atual++;
			}
		}
	}
}

function reset_xp()
{
	if global.xp_atual		!= 0	{ global.xp_atual = 0		}
	if global.xp_objetivo	!= 10	{ global.xp_objetivo = 10	}
	if global.nivel			!= 1	{ global.nivel = 1			}
}