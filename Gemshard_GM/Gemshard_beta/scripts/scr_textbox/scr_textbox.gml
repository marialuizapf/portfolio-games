function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//Variaveis para toda letra
	for (var c = 0; c < 500; c++){
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
		
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c*20;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
	}
	
	txtb_spr[page_number]= spr_text_box;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
}

//--------------------- Texto VFX -------------------------//
/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function scr_text_color(_start, _end, _col1, _col2 , _col3, _col4){
	
	for (var c = _start; c <= _end; c++){
		col_1[c, page_number-1] = _col1;
		col_2[c, page_number-1] = _col2;
		col_3[c, page_number-1] = _col3;
		col_4[c, page_number-1] = _col4;
	}
}


/// @param 1st_char
/// @param last_char
function scr_text_float(_start, _end){
	for (var c = _start; c <= _end; c++){
		float_text[c, page_number - 1] = true;
	}
}


/// @param 1st_char
/// @param last_char
function scr_text_shake(_start, _end){
	for (var c = _start; c <= _end; c++){
		shake_text[c, page_number - 1] = true;
	}
}




/// @param text
/// @param [character]
function scr_text(_text){
	
	scr_set_defaults_for_text()
	
	text[page_number] = _text;
	
	if argument_count > 1 {
		switch(argument[1]){
		
			case "player":
				speaker_sprite[page_number] = spr_player;
				txtb_spr[page_number] = spr_text_box;
				break;
			case "":
				break;
		}
	}
	page_number ++;
	
}


/// @param text_id
function create_textbox(_text_id){
	
	with(instance_create_depth(0,0, -9999, obj_textbox)){
		
		scr_game_text(_text_id);
	}
}