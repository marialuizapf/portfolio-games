var player = instance_find(obj_plyr, 0);

if player != noone && point_distance(x, y, player.x, player.y) < 30 && keyboard_check_pressed(vk_space){
	if global.cont_locked_1 == 0 && !global.has_key_1 {
		
		create_textbox(text_id);
		global.cont_locked_1 = 1;
	} 

}

if global.has_key_1 {
		instance_destroy();
	}
