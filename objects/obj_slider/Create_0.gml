valor_msc = 1;
valor_sfx = 1;


if valor_msc != global.music_volume { valor_msc = global.music_volume }
if valor_sfx != global.sfx_volume	{ valor_sfx = global.sfx_volume }


cor_selec = c_white;

altera_finalidade = function() 
{
	
    if (finalidade == "Volume msc") 
	{
       
	   global.music_volume = valor_msc;
       audio_sound_gain(snd_musica_2, global.music_volume, 0);
	   
    }
    else if (finalidade == "Volume sfx") 
	{
       
	   global.sfx_volume = valor_sfx;
        var efeitos = [snd_andando, snd_guarda_arma, snd_leva_dano_en, snd_leva_dano_player, 
                       snd_level_up, snd_morte_en, snd_morte_player, snd_recarrega, snd_saca_arma, 
                       snd_sinal, snd_tiro_bulldog, snd_tiro_pistol, snd_tiro_shotgun];
        
		for (var i = 0; i < array_length(efeitos); i++) 
		{
            audio_sound_gain(efeitos[i], global.sfx_volume, 0);
        }
    }
};

desenha_slider = function() 
{
    var y_msc = y;
    var y_sfx = y + 40;

    // Barra de Música
    var selec_x_msc = x + (sprite_width * valor_msc);
    draw_self();
    draw_sprite_part_ext(sprite_index, 0, 0, 0, sprite_width * valor_msc, sprite_height, x, y_msc - sprite_yoffset, 1, 1, c_purple, 1);
    draw_sprite_ext(spr_slider_selec, 0, selec_x_msc, y_msc, 1, 1, 0, cor_selec, 1);

    // Barra de Efeitos
    var selec_x_sfx = x + (sprite_width * valor_sfx);
    draw_sprite_part_ext(sprite_index, 0, 0, 0, sprite_width, sprite_height, x, y_sfx - sprite_yoffset, 1, 1, c_white, 1);
    draw_sprite_part_ext(sprite_index, 0, 0, 0, sprite_width * valor_sfx, sprite_height, x, y_sfx - sprite_yoffset, 1, 1, c_blue, 1);
    draw_sprite_ext(spr_slider_selec, 0, selec_x_sfx, y_sfx, 1, 1, 0, cor_selec, 1);
};

altera_valor = function() 
{
    static _mover_msc = false;
    static _mover_sfx = false;

    var mouse_click = mouse_check_button(mb_left);
    var mouse_press = mouse_check_button_pressed(mb_left);

    // Posição e checagem da barra de música
    var selec_x_msc = x + (sprite_width * valor_msc);
    var mouse_sobre_msc = point_in_rectangle(mouse_x, mouse_y, x, y - 5, x + sprite_width, y + sprite_height + 5);

    if (mouse_sobre_msc && mouse_press) 
	{
        _mover_msc = true;
        finalidade = "Volume msc"; 
    }
	
    if (_mover_msc) 
	{
        valor_msc = (mouse_x - x) / sprite_width;
        valor_msc = clamp(valor_msc, 0, 1);
        global.music_volume = valor_msc; 
        altera_finalidade(); 
        if (!mouse_click) _mover_msc = false;
    }

    var selec_x_sfx = x + (sprite_width * valor_sfx);
    var mouse_sobre_sfx = point_in_rectangle(mouse_x, mouse_y, x, y + 40 - 5, x + sprite_width, y + 40 + sprite_height + 5);

    if (mouse_sobre_sfx && mouse_press) 
	{
        _mover_sfx = true;
        finalidade = "Volume sfx"; 
    }
	
    if (_mover_sfx) 
	{
        valor_sfx = (mouse_x - x) / sprite_width;
        valor_sfx = clamp(valor_sfx, 0, 1);
        global.sfx_volume = valor_sfx;  
        altera_finalidade(); 
        if (!mouse_click) _mover_sfx = false;
    }
};