/// @description Change sprite if mouse touches it

if (point_in_rectangle(mouse_x, mouse_y, x - 73, y - 22, x + 73, y + 22)){
    image_index = 1;
    if (!audio_is_playing(snd_hover) && snd != 1){
               audio_play_sound(snd_hover, 1, 0);
        snd = 1;
    }
    if mouse_check_button_released(mb_left) {
        image_index = 2;
        alarm[0] = 15;
    }
} else {
    image_index = 0;
    snd = 0;
}

