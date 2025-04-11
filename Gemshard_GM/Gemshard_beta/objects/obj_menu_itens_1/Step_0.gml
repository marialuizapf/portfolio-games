up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);


pos+= down_key - up_key;
if(pos>= op_length){pos=0};
if(pos< 0 ){pos = op_length-1};

instance_create_layer(0, 0, "Instances", obj_wall);
if(accept_key){
	
switch(pos){
	case 0:
		room_goto(rm_menu);
		break;
	case 1:
		game_end();
		break;
	}	
}
