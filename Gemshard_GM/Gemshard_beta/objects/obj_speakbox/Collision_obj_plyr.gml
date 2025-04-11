if global.cont == 0 {
	create_textbox(text_id);
	instance_destroy();
	global.cont = 1;
}