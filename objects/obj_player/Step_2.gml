/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/*
//sistema de colisão horizontal e movimentação

var _hspd = sign(hspd);

//Deixar o hspd positivo SEMPRE
repeat abs(hspd)
{
	//Esse código vai ser repetido a quantidade de vezes que eu tenho no hspd
	
	//Checar se o espaço para onde eu vou me mover, tem alguém
	if place_meeting(x + _hspd,y,obj_block)
	{
		//O que fazder se eu colidir com alguém
		hspd = 0;
	}
	else //se eu NÃO colidir com alguém
	{
		//Eu posso me mover
		x += _hspd;
	}
}

//sistema de colisão e movimentação vertical
 var _vspd = sign(vspd);
 
 repeat abs(vspd)
 {
	if place_meeting(x,y + _vspd,obj_block)
	{vspd = 0;}
	else
	{y += _vspd;}
 }