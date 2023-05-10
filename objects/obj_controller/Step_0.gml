// Debugging
if keyboard_check(vk_control) {
       if keyboard_check_pressed(ord("D")) {
            if debug {
                debug = false;
            } else {
                debug = true;
            }
       }
       if debug {
              if keyboard_check_pressed(ord("P")) {
                     // Print screen goes here
                     screen_save(working_directory + "\\Screens\\Screen"+".png")
                     //scr_screenshot();
              }
              if keyboard_check_pressed(ord("F")) {
                  if window_get_fullscreen() = true {
                         window_set_fullscreen(false);
                  } else window_set_fullscreen(true);
              }
               // Game end
               if keyboard_check_pressed(ord("W")) {
                    game_end();
               }
               if keyboard_check_pressed(ord("R")) {
                    if keyboard_check(vk_shift) {
                        // Restart game
                        game_restart();
                    } else {
                        // Restart room
                        room_restart();
                    }
               }
       }
}

// Debug code only
if instance_exists(obj_player) {
       if keyboard_check(vk_right) {
              if obj_player.hp < obj_player.hp_max {
                     obj_player.hp += 1;
              }
       }
       if keyboard_check(vk_left) {
              if obj_player.hp > 0 {
                     obj_player.hp -= 1;
              }
       }
       if keyboard_check_pressed(ord("C")) && obj_player.can_get_hit = 1 {
              obj_player.can_get_hit = 0;
       }
}

// Fake "bullet time"
if mouse_check_button(mb_right) {
       if keyboard_check(vk_control) {
              room_speed = 120;
       } else {
            room_speed = 20;
       }
} else {
    room_speed = 60;
}

/*
menu_level[0] = 0;   // Current top menu level
menu_level[1] = 0;   // Current sub menu level

volume_master = 1;   // Volume level of all sounds
volume_music = 1;    // Volume level for just music
volume_sound = 1;    // Volume level for just sound effects
volume_mute = 0;     // Boolean for muting all sounds
*/

// Game Room
if room = room0 {
       if !audio_is_playing(snd_ouroboros) {
              // Uncomment below to play music
              // audio_play_sound(snd_ouroboros, 0, 1);
       }
       if instance_exists(obj_player) {
              if obj_player.hp > 0 && (obj_player.state != "Dead" || obj_player.state != "Intro" || obj_player.state != "Begin_Intro") {
                     stats[? "time_alive"] += 1;
              }
              if obj_player.state = "Dead" && obj_player.y <= -64 {
                     // Starting to display background
                     if go_bg_alpha < 1 {
                            go_bg_alpha += 0.05;
                     } else {
                            // Put button actions here
                            if go_bg_alpha > 0 {
                                   if mouse_x = clamp(mouse_x,room_width/2-sprite_get_width(spr_retry)/2,room_width/2+sprite_get_width(spr_retry)/2) && mouse_y = clamp(mouse_y,425,425+sprite_get_height(spr_retry)) {
                                          can_button_hover = 1;
                                          if mouse_check_button_pressed(mb_left) {
                                                 if instance_exists(obj_player) {
                                                        obj_player.state = "Begin_Intro";
                                                 }
                                                stats[? "shots_fired"] = 0;
                                                stats[? "shots_hit"] = 0;
                                                stats[? "time_alive"] = 0;
                                                stats[? "wave"] = 1;
                                                stats[? "damage_dealt"] = 0;
                                                 instance_destroy(obj_enemy);
                                                 instance_destroy(obj_bullet);
                                                 instance_destroy(obj_casing);
                                                 instance_destroy(obj_combat_text);
                                                 audio_play_sound(snd_select,0,0);
                                                 can_button_hover = 0;
                                                 go_bg_alpha = 0;
                                          }
                                   } else {
                                        can_button_hover = 0;
                                   }
                            }
                     }
              }
       }
}

// Screen shake
if screen_shake_time > 0 {
       screen_shake_time -= 1;
       __view_set( e__VW.XView, 0, -screen_shake_amount+floor(random(screen_shake_amount * 2)) );
       __view_set( e__VW.YView, 0, (-screen_shake_amount+floor(random(screen_shake_amount * 2)))/2 );
} else {
       __view_set( e__VW.XView, 0, 0 );
       __view_set( e__VW.YView, 0, 0 );
}

// Mouse_over Buttons
if can_button_hover = 1 {
       button_timer += 1;
       if button_timer = 1 {
              audio_play_sound(snd_hover,0,0);
       }
} else {
    button_timer = 0;
}


/* */
/*  */
