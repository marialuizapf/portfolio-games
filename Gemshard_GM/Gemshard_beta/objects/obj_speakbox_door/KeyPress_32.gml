
var player = instance_find(obj_plyr, 0);
if (player != noone && point_distance(x, y, player.x, player.y) < 40) {
	
	if (global.cont_door_1 == 0 && text_id == "door1_key" && global.has_key_3) { 
		
		create_textbox(text_id);
		global.cont_door_1 = 1;
	}

	if (global.cont_door_2 == 0 && text_id == "door2"){
	
		create_textbox(text_id);
		global.cont_door_2 = 1;
	}

	if (global.cont_door_3 == 0 && text_id == "door3_key" && global.has_key_1){
	
		create_textbox(text_id);
		global.cont_door_3 = 1;
	}

	if (global.cont_door_4 == 0 && text_id == "door4_key" && global.has_key_2){

		create_textbox(text_id);
		global.cont_door_4 = 1;
	}

} 