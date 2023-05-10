// Testing - Putting the window screen on the left screen
right_screen = 0;
if right_screen == 1 {
       window_set_position(2560+(1680/2)-floor(window_get_width())/2,64);
}

menu_state = "Main";

// Button Hovers
button_play_index = 0;
button_options_index = 0;
button_quit_index = 0;
quit_time = 0;
options_height = 0;

// Menu states
menu_index = 0;
menu_grid[0,0] = "Main";
menu_grid[1,0] = 92;
menu_grid[2,0] = 0.05;
menu_grid[3,0] = c_black;
menu_grid[0,1] = "Options";
menu_grid[1,1] = 92;
menu_grid[2,1] = 0.35;
menu_grid[3,1] = c_black;

// Black bars
bar_height = 0;
bar_height_mult = menu_grid[2,menu_index];
bar_color = menu_grid[3,menu_index];
bar_color_prev = bar_color;

// Music volume level
volume_level[0,0] = "Music level"; // Volume level name
volume_level[1,0] = 1;// Music level
volume_level[2,0] = 0; // Music level is muted
volume_level[3,0] = 0; // Music level slider active
volume_level[4,0] = volume_level[1,0]; // Previous music level
volume_level[0,1] = "Sound level"; // Volume level name
volume_level[1,1] = 1; // Sound level
volume_level[2,1] = 0; // Sound level is muted
volume_level[3,1] = 0; // Sound level slider active
volume_level[4,1] = volume_level[1,1]; // Previous sound level

// Volume sliders for drawing
music_slider_width = 0;
music_slider_height = 0;
music_slider_x = 0;
music_slider_y = 0;

