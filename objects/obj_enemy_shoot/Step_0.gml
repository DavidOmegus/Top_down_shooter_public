image_angle++;

if image_xscale > 1 and image_yscale > 1
	dano = 2;
	
life_time--;

if life_time <= 0 
{ 
	instance_destroy()
}