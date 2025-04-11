draw_set_font(global.font_itens);
draw_sprite_ext(spr_menu, image_index, 0, 0, 1, 1, 0, c_white, 1);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

for(var i =0; i < op_length;i++){
	if pos == i { 
		_c = c_yellow
		draw_text_color(x + op_border, y +op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1);
	} else{ draw_text(x + op_border, y +op_border + op_space*i, option[menu_level, i]);}		
}

