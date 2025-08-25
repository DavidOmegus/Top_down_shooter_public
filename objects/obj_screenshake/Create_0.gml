/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Create
randomize();

//criando a minha variável global do screenshake
global.screenshake_value = 0;

//balançando a tela
shake = function(_value)
{
	view_xport[0] = random_range(-_value,_value);
	view_yport[0] = random_range(-_value,_value);
}