// Enabling views
/*
if !view_enabled {
       view_visible[0] = true;
       view_enabled = 1;
       // view_wview[0] = 450;
       // view_hview[0] = 650;
       // view_wview[0] = 1024;
       // view_hview[0] = 576;
       view_xview[0] = 0;
       view_yview[0] = 0;
}*/

// Game Over screen
if go_bg_alpha > 0 {
       draw_set_alpha(go_bg_alpha);
       draw_set_color(make_color_rgb(64,64,64));
       draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),0);
       draw_set_color(c_black);
       draw_set_alpha(1);
       if go_bg_alpha = 1 {
              draw_sprite(spr_game_over,0,room_width/2-sprite_get_width(spr_game_over)/2,64);
              draw_set_color(c_white);
              draw_line(room_width/2,0,room_width/2,room_height);
              draw_set_font(fnt_candal20);
              draw_set_halign(fa_middle);
              var score_text = "";
              score_text += "Score: N/A#";
              score_text += "High Score: N/A";
              draw_text(room_width/2,200,string_hash_to_newline(string(score_text)));
              var stats_text = "";
              stats_text[0] = "";
              stats_text[1] = "";
              stats_text[0] += "Run Time: #";
              var stats_seconds = string(floor(stats[? "time_alive"] / 60));
              if string_length(stats_seconds) = 1 {
                     stats_seconds = "0" + stats_seconds;
              }
              var stats_minutes = string(floor(stats[? "time_alive"] / 60 / 60));
              if string_length(stats_minutes) = 1 {
                     stats_minutes = "0" + stats_minutes;
              }
              stats_text[1] += stats_minutes + ":" + stats_seconds + "#";
              stats_text[0] += "Wave Reached: #";
              stats_text[1] += "Wave " + string(stats[? "wave"]) + "#";
              stats_text[0] += "Hit Accuracy: #";
              if stats[? "shots_fired"] > 0 {
                     stats_text[1] += string(stats[? "shots_hit"] / stats[? "shots_fired"] * 100) + "%#";
              } else {
                stats_text[1] += "0%#";
              }
              stats_text[0] += "Total Damage Dealt: #";
              stats_text[1] += string(stats[? "damage_dealt"]);
              draw_set_halign(fa_right);
              draw_set_font(fnt_candal14);
              draw_text(room_width / 2 + 37, 300, string_hash_to_newline(string(stats_text[0])));
              draw_set_halign(fa_left);
              draw_text(room_width / 2 + 37, 300, string_hash_to_newline(string(stats_text[1])));
              draw_set_font(-1);
              draw_set_color(c_black);
              if mouse_x = clamp(mouse_x,room_width/2-sprite_get_width(spr_retry)/2,room_width/2+sprite_get_width(spr_retry)/2) && mouse_y = clamp(mouse_y,425,425+sprite_get_height(spr_retry)) {
                     var set_index = 1;
              } else {
                set_index = 0;
              }
              draw_sprite(spr_retry, set_index, room_width / 2 - sprite_get_width(spr_retry) / 2, 425);
       }
}

// Debugging
if debug {
       var debug_text = "";
       debug_text += "// Debug Mode //" + "##";
       debug_text += "debug_text: " + string(debug) + "#";
       debug_text += "fps_real: " + string(fps_real) + "#";
       if instance_exists(obj_player) {
              debug_text += "obj_player.state: " + string(obj_player.state) + "#";
              debug_text += "gun_dir: " + string(obj_player.gun_dir) + "#";
              debug_text += "player_ammo: " + string(obj_player.ammo) + "#";
              debug_text += "player tweening: " + string(obj_player.image_angle) + " :: " + string(obj_player.tangle_want * obj_player.tangle_dir) + "#";
       }
       if instance_exists(obj_char_select) {
              for(i = 0; i < 4; i++) {
                     debug_text += "arm_place[" + string(i) + "]: " + string(obj_char_select.arm_place[i]) + "#";
              }
       }
       debug_text += "num enemies: " + string(instance_number(obj_enemy)) + "#";
       debug_text += "room_name: " + string(room_get_name(room)) + "#";
       debug_text += "working dir: " + string(working_directory) + "#";
       draw_text(96, 10, string_hash_to_newline(debug_text));
}

/* */
/*  */
