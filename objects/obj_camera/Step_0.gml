/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if !instance_exists(obj_player) exit;
x = lerp(x,target.x,.1);
y = lerp(y,target.y - height / 4,.1);
//camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);