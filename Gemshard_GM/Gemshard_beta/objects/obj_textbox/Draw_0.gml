
accept_key = keyboard_check_pressed(vk_enter);


var camera_x = camera_get_view_x(view_camera[0]);
var camera_y = camera_get_view_y(view_camera[0]);

textbox_x = camera_x + 4; 
textbox_y = camera_y + 216 - 80; 
/*
textbox_x = camera_get_view_x(view_camera[0]+ 80);
textbox_y = camera_get_view_y(view_camera[0]) + 136;
*/

obj_plyr.can_move = false;

//-------------------------------- Setup ----------------------------------//
if setup == false {
	
	setup = true;
	draw_set_font(global.font_itens);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for (var p = 0;p < page_number; p++){
		//Descobrir quanto carcateres tem em cada pagina
		text_length[p] =  string_length(text[p]);
		
		//Personagem na esquerda
		text_x_offset[p] = 80;
		portrait_x_offset[p] = 8;	
		
		//Personagem na direita
		
		if speaker_side[p] == -1{
			text_x_offset[p] = 8;
			portrait_x_offset[p] = 208;
		}
		
		if speaker_sprite[p] == noone{
		text_x_offset[p] = 48;
		}
		
		for (var c = 0; c < text_length[p]; c++){
		
			var _char_pos = c + 1;
			
			char[c, p] = string_char_at(text[p], _char_pos);
			
			var _txt_up_to_char = string_copy( text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			
			if char[c, p] == " " {last_free_space = _char_pos + 1};

			if _current_txt_w - line_break_offset[p] > line_width{
				
				line_break_pos[ line_break_num[p], p ] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy( text[p], 1, last_free_space );
				var _last_free_space_string = string_char_at( text[p], last_free_space );
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		
		for (var c = 0; c < text_length[p]; c++){
			
			var _char_pos = c + 1;
			var _txt_x = textbox_x + text_x_offset[p] + border; 
			var _txt_y = textbox_y + border;
			var _txt_up_to_char = string_copy( text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			var _txt_line = 0;
			
			for (var lb = 0;lb < line_break_num[p]; lb++){
				
				if _char_pos >= line_break_pos[lb, p]{
			
					var _str_copy = string_copy( text[p], line_break_pos[lb, p], _char_pos-line_break_pos[lb, p] );
					_current_txt_w = string_width( _str_copy );
					
					_txt_line = lb + 1;
				}
			}
			
		char_x[c, p] = _txt_x + _current_txt_w;
		char_y[c, p] = _txt_y + _txt_line*line_sep;
		}
	}
}


//-------------------------------- Escrevendo o texto ----------------------------------//
if text_pause_timer <= 0 {
	if draw_char < text_length[page]{
		
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		if _check_char == "." || _check_char == "?" || _check_char == "!" || _check_char == ","{
			text_pause_timer = text_pause_time;	
		}
	}
} else {
	text_pause_timer--;
	
}
	
	
	
//-------------------------------- Passar pelas páginas ------------------------------//
if accept_key {
	
	if draw_char == text_length[page]{
		
		if page < page_number -1 {
			page++;
			draw_char = 0;
				
		} else {
			 obj_plyr.can_move = true;
			instance_destroy();
		}
	} else {
			draw_char = text_length[page];
	}
}
		
		
		
//-------------------------------- Desenhar a textbox --------------------------------//



var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;

txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);

//Desenhar o personagem
if speaker_sprite[page] != noone {
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page] {sprite_index = spr_player_blink};
	var _speaker_x = textbox_x +portrait_x_offset[page];
	if speaker_side[page] == -1 {_speaker_x += sprite_width}; 
	
	draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
}

//Fundo da textbox
draw_sprite_ext(txtb_spr[page],txtb_img, _txtb_x,  _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);


//Desenhar o texto
for (var c = 0;c < draw_char; c++){

	//--------------- Coisinhas Especiais -----------------//
	//Texto flutuante
	var _float_y = 0;
	if float_text[c, page] == true{
		float_dir[c, page] += -6;
		_float_y = dsin( float_dir[c, page] )*2;
	}

	//Texto trêmulo
	var _shake_x = 0;
	var _shake_y = 0;
	if shake_text[c, page] == true {
		shake_timer[c, page]--;
		if shake_timer[c, page] <= 0{
			shake_timer[c, page] = irandom_range(4, 8);
			shake_dir[c, page] = irandom(360);
		}
		if shake_timer[c, page] <= 2{
			_shake_x = lengthdir_x(1, shake_dir[c, page]);
			_shake_y = lengthdir_y(1, shake_dir[c, page]);
		}
	}

	//O texto
	draw_text_color(char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page],col_4[c, page], 1);
}
	




