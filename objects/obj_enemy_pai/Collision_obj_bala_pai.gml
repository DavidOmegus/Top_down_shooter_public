/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//faz o teste de crítico
critico_teste = random_range(1,100);
//se for menor que a minha chance de crítico, tomei crítico
if critico_teste <= critico_chance { receber_dano_critico = true }

//se eu tomo ataque crítico, levo o triplo do dano, caso contrário, levo dano
//normal
if !receber_dano_critico
	tomar_dano(other.dano);
else if receber_dano_critico
	tomar_dano(other.dano*3);

//criando barulho de atacado e destruindo a bala
audio_play_sound(snd_leva_dano_en,50,false,global.sfx_volume);
instance_destroy(other);