right_key = keyboard_check(vk_right); 
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

xspd = (right_key - left_key)* move_spd;
yspd = (down_key - up_key)* move_spd;

//Pause
if instance_exists(obj_pause){
	yspd = 0;
	xspd = 0;
	}
if (!obj_plyr.can_move) {
	xspd = 0;
    yspd = 0;
	}	

//Sprites
mask_index = sprite[DOWN];
if yspd == 0 {
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
	}
if xspd > 0 && face == LEFT {face = RIGHT};
if xspd < 0 && face == RIGHT {face = LEFT};
if xspd == 0 {	
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
	}
if yspd > 0 && face == UP {face = DOWN};
if yspd < 0 && face == DOWN {face = UP};
sprite_index = sprite[face];


//Colisões

	//Wall
if place_meeting(x + xspd,y, obj_wall) == true{
		xspd = 0;
	}
if place_meeting(x,y + yspd, obj_wall) == true{
		yspd = 0;
	}
	
	//Porta fechada
if place_meeting(x + xspd,y, obj_locked_warp) == true{
		xspd = 0;
	}
if place_meeting(x,y + yspd, obj_locked_warp) == true{
		yspd = 0;
	}	
	
	//Porta
if place_meeting(x + xspd, y, obj_door_base) {
    var door = instance_place(x + xspd, y, obj_door_base);  
    if (door.is_open == false) {  
        xspd = 0;
    }
}
if place_meeting(x, y + yspd, obj_door_base) {
   var door = instance_place(x, y + yspd, obj_door_base); 
     if (door.is_open == false) {  
        yspd = 0;
    }
}

//Movimentação
x += xspd;
y += yspd;


//Animação
if xspd == 0 && yspd == 0 {image_index = 0};

//Game Over

if (hearts == 0) {
    show_message("Game Over!");
    instance_destroy();
}

