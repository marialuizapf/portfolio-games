function abrir_porta() {
	obj_plyr.can_move = false; // Impede o movimento do player
	image_index = 0 // Define a sprite da porta aberta
	image_speed = 1;
}


if (!is_open) { 
	var player = instance_find(obj_plyr, 0);
	if (player != noone && point_distance(x, y, player.x, player.y) < 40) {
	    // Verifica se o player tem a chave necessária para abrir a porta
	    if ((door_index == 3 && player.has_key_3) ||
	        (door_index == 2 && player.has_key_2) ||
	        (door_index == 1 && player.has_key_1) ||
	        (door_index == 0)) { // Porta 1 não precisa de chave
	        abrir_porta();
			is_open = true;
			
	    } else{
			create_textbox(text_id);
		}
	}
}
