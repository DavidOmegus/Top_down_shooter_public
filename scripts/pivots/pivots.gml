// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function Pivot(_x,_y) constructor
{
	x = _x;
	y = _y;
	
	_sprite_xoffset = other.sprite_xoffset;
	_sprite_yoffset = other.sprite_yoffset;
	
	len = point_distance(_sprite_xoffset,_sprite_yoffset,x,y);
	dir = point_direction(_sprite_xoffset,_sprite_yoffset,x,y);
	
	static atualiza_pos = function(_ang = other.image_angle,_mudar = false)
	{
		
		if _mudar
		{
			len = point_distance(_sprite_xoffset,_sprite_yoffset,x * other.image_xscale,y * other.image_yscale);	
			dir = point_direction(_sprite_xoffset,_sprite_yoffset,x * other.image_xscale,y * other.image_yscale);	
		}
		
		var _pos = 
		{
			x : lengthdir_x(len,dir + _ang),
			y : lengthdir_y(len,dir + _ang),
		}
		
		return _pos;
		
	}
}