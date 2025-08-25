randomize();

if !instance_exists(obj_player) { instance_create_layer(random(room_width),random(room_height),"player",obj_player) }
if !instance_exists(obj_screenshake) { instance_create_layer(0,0,"screenshake",obj_screenshake) }
if !instance_exists(obj_control) { instance_create_layer(0,0,"player",obj_control) }
if !instance_exists(obj_camera) { instance_create_layer(0,0,"screenshake",obj_camera) }