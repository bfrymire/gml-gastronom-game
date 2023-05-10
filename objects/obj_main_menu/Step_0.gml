// Testing
if keyboard_check(vk_control) {
       if keyboard_check_pressed(ord("R")) {
              room_restart();
       }
}

// Bar animations
if bar_height != menu_grid[1,menu_index] {
       bar_height += (menu_grid[1,menu_index] - bar_height) * menu_grid[2,menu_index];
}
if bar_color != menu_grid[3,menu_index] {
       bar_color = merge_colour(bar_color_prev,menu_grid[3,menu_index],min(bar_height,menu_grid[1,menu_index])/max(bar_height,menu_grid[1,menu_index]));
}

// Menu state button actions
if menu_index = 0 {
       if quit_time = 0 {
              // Play Button
              var play_button_y = 32 + sprite_get_height(spr_logo) + 80;
              if mouse_x = clamp(mouse_x,floor(room_width/2-265/2),floor(room_width/2+265/2)) && mouse_y = clamp(mouse_y,play_button_y,play_button_y+82) {
                     if button_play_index = 0 {
                            button_play_index = 1;
                            audio_play_sound(snd_hover,0,0);
                     } else if button_play_index = 1 {
                            if mouse_check_button_pressed(mb_left) {
                                   button_play_index = 2;
                            }
                     } else if mouse_check_button_released(mb_left) {
                            button_play_index = 0;
                            audio_play_sound(snd_select,0,0);
                            // Go to game
                            if room_exists(room_next(room)) {
                                room_goto_next();
                            } else {
                                room_goto(0);
                            }
                     }
              } else button_play_index = 0;
              // Options Button
              if mouse_x = clamp(mouse_x,63+43,63+sprite_get_width(spr_options)) && mouse_y = clamp(mouse_y,447,447+57) {
                     if button_options_index = 0 {
                            button_options_index = 1;
                            audio_play_sound(snd_hover,0,0);
                     } else if button_options_index = 1 {
                            if mouse_check_button_pressed(mb_left) {
                                   button_options_index = 2;
                            }
                     } else if mouse_check_button_released(mb_left) {
                            // Go to options menu
                            button_options_index = 0;
                            audio_play_sound(snd_select,0,0);
                            menu_index = 1;
                            bar_color_prev = bar_color;
                     }
              } else button_options_index = 0;
              // Quit Button
              if mouse_x = clamp(mouse_x,735,735+183) && mouse_y = clamp(mouse_y,447,447+57) {
                     if button_quit_index = 0 {
                            button_quit_index = 1;
                            audio_play_sound(snd_hover,0,0);
                     } else if button_quit_index = 1 {
                            if mouse_check_button_pressed(mb_left) {
                                   button_quit_index = 2;
                            }
                     } else if mouse_check_button_released(mb_left) {
                            // Start exit game animation
                            button_quit_index = 0;
                            audio_play_sound(snd_select,0,0);
                            quit_time += 1;
                     }
              } else button_quit_index = 0;
       } else {
              quit_time += 1;
              if keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace) {
                     quit_time = 0;
              }
              if quit_time >= game_get_speed(gamespeed_fps) * 1 {
                     game_end();
              }
       }
}
if menu_index = 1 {
       var options_height_want = 503;
       var options_width = 409;
       var options_x = floor(room_width/2-options_width/2)+1;
       var options_y = room_height-options_height;
       var padding_horizontal = 48;
       if options_height = options_height_want && options_height_want != 0 {
              if mouse_check_button_pressed(mb_left) {
                     // Exit Options if you click outside of modal
                     if !(mouse_x = clamp(mouse_x,room_width/2-options_width/2,room_width/2+options_width/2) && mouse_y = clamp(mouse_y,room_height-options_height_want,room_height)) {
                            menu_index = 0;
                            bar_color_prev = bar_color;
                            volume_level[3,0] = 0;
                            volume_level[3,1] = 0;
                     } else {
                            // Exit Options if you click the 'X' in the corner
                            // Put another clamp here...
                            
                            // Make music volume slider active
                            music_slider_width = sprite_get_width(spr_volume_slider);
                            music_slider_height = sprite_get_height(spr_volume_slider);
                            music_slider_x = options_x+options_width-padding_horizontal-sprite_get_width(spr_volume_slider);
                            music_slider_y = options_y+122+28-sprite_get_height(spr_volume_slider);
                            if mouse_x = clamp(mouse_x,music_slider_x,music_slider_x+sprite_get_width(spr_volume_slider)) && mouse_y = clamp(mouse_y,music_slider_y,music_slider_y+sprite_get_height(spr_volume_slider)) {
                                   volume_level[3,0] = 1;
                                   volume_level[2,0] = 0;
                            }
                            // Mute if clicking music speaker
                            if mouse_x = clamp(mouse_x,music_slider_x-8-sprite_get_width(spr_volume),music_slider_x-8) && mouse_y = clamp(mouse_y,music_slider_y,options_y+122+floor(string_height(string_hash_to_newline("MUSIC"))/2+sprite_get_height(spr_volume)/2)) {
                                   if volume_level[2,0] = 1 && volume_level[1,0] > 0 {
                                          volume_level[2,0] = 0;
                                   } else if volume_level[2,0] = 0 && volume_level[1,0] > 0 {
                                          volume_level[2,0] = 1;
                                   } else if volume_level[2,0] = 1 && volume_level[1,0] = 0 {
                                          volume_level[1,0] = 1;
                                   } else if volume_level[2,0] = 0 && volume_level[1,0] = 0 {
                                          volume_level[1,0] = 1;
                                   }
                            }
                     }
              }
              // Exit Options if you press escape
              if keyboard_check_pressed(vk_escape) {
                     if volume_level[3,0] = 1 || volume_level[3,1] = 1 {
                            volume_level[3,0] = 0;
                            volume_level[3,1] = 0;
                     } else {
                            menu_index = 0;
                            bar_color_prev = bar_color;
                     }
              }
       }
       if volume_level[3,0] = 1 {
              volume_level[1,0] = (clamp(mouse_x,music_slider_x+16,music_slider_x+16+102)-music_slider_x-16)/102;
       }
       if volume_level[3,1] = 1 {
              volume_level[1,1] = (clamp(mouse_x,music_slider_x+16,music_slider_x+16+102)-music_slider_x-16)/102;
       }
       if mouse_check_button_released(mb_left) {
              volume_level[3,0] = 0;
              volume_level[3,1] = 0;
       }
       
       /* Music volume level
       volume_level[0,0] = "Music level"; // Volume level name
       volume_level[1,0] = 1;// Music level
       volume_level[2,0] = 0; // Music level is muted
       volume_level[3,0] = 0; // Music level slider active
       volume_level[4,0] = volume_level[1,0]; // Previous music level
       */

} else options_height_want = 0;
if options_height != options_height_want {
       options_height += (options_height_want - options_height) * menu_grid[2,1];
}

/* */
/*  */
