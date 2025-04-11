for (var i = 0; i < 3; i++) {
    if (heart_state[i] == 1) {
        // Avança a animação
        heart_frame[i] += 0.2; // Controla a velocidade da animação

        // Verifica se a animação atingiu o último frame
        if (heart_frame[i] >= sprite_get_number(spr_heart_dmg) - 1) {
            heart_frame[i] = sprite_get_number(spr_heart_dmg) - 1; // Fixa no último frame
            heart_state[i] = 2; // Estado "parado no último frame"
        }
    } 
}