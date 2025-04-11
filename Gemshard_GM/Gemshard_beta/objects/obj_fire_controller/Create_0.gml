num_fire_walls = 15; 

area_x_min = 38;
area_x_max = 230;
area_y_min = 24;
area_y_max = 170;

alarm[0] = irandom_range(12, 300);
/*
for (var i = 0; i < num_fire_walls; i++) {
    var random_x = irandom_range(area_x_min, area_x_max); 
    var random_y = irandom_range(area_y_min, area_y_max);
    instance_create_layer(random_x, random_y, "Instances", obj_fire);
}
