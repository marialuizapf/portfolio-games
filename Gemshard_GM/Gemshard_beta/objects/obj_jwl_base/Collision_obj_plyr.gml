if (key_index == 1) {
    obj_plyr.has_key_1 = true;
	global.has_key_1 = true;
} else if (key_index == 2) {
    obj_plyr.has_key_2 = true;
	global.has_key_2 = true;
} else if (key_index == 3) {
    obj_plyr.has_key_3 = true;
	global.has_key_3 = true;
}
create_textbox(text_id);
instance_destroy();  
effect_create_above(ef_spark,x,y,1,c_white)
