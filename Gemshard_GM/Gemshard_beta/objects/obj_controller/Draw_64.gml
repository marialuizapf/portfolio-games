var _scale = 2;
var _guide = display_get_gui_height();
var _spra = sprite_get_height(spr_life);
var _huda  = 16


//HUD

/*
draw_sprite_ext(spr_life, 0, 16, _huda, _scale, _scale, 0, c_white, 1);
draw_sprite_ext(spr_life, 0, 16 + 68 , _huda , _scale, _scale, 0, c_white, 1);
draw_sprite_ext(spr_life, 0, 16 + 136, _huda , _scale, _scale, 0, c_white, 1);
*/

for (var i = 0; i < 3; i++) {
    if (heart_state[i] == 0) {
        draw_sprite_ext(spr_life,  0, 20 + (i * 68),20, 2,2, 0, c_white, 1);
    }
    else if (heart_state[i] == 1 || heart_state[i] == 2) {

        draw_sprite(spr_heart_dmg, floor(heart_frame[i]), 20 + (i * 40), 20);
    }
}
//Life Bar
