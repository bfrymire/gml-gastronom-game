// Player has control of arm

// food_list[0,0] = hovered
// food_list[0,1] = selected

if act[0] = 0 {
       arm_place[0] = mouse_x;
       if mouse_y < 190 {
              arm_place[1] = 190;
       } else arm_place[1] = mouse_y;
       for(var i = 0; i < 4; i++) {
              var center_sprite_x = floor(room_width/2+lengthdir_x(90,90*i));
              var center_sprite_y = floor(190+floor(sprite_get_height(spr_plate)/2)+lengthdir_y(90,90*i));
              if mouse_x = clamp(mouse_x,center_sprite_x-32,center_sprite_x+32) && mouse_y = clamp(mouse_y,center_sprite_y-32,center_sprite_y+32) {
                     food_list[i,0] = 1;
                     if mouse_check_button_pressed(mb_left) {
                            food_list[i,1] = 1;                                     // make hoverted food selected
                            selected_char = food_char_list[i];                      // move over the food that is selected
                            arm_place[2] = center_sprite_x + lengthdir_x(90,120);   // arm x location want
                            arm_place[3] = center_sprite_y + lengthdir_y(90,120);   // arm y location want
                            act[0] = 1;                                             // move over to the next act
                            break;
                     }
              } else food_list[i,0] = 0;
       }
}

// Arm moving over to selected food
if act[0] = 1 {
       arm_place[0] += (arm_place[2] - arm_place[0]) * 0.15;
       arm_place[1] += (arm_place[3] - arm_place[1]) * 0.15;
       if point_distance(arm_place[0],arm_place[1],arm_place[2],arm_place[3]) <= 3 {
              arm_place[0] = arm_place[2];
              arm_place[0] = arm_place[2];
       }
       if arm_place[0] = arm_place[2] && arm_place[1] = arm_place[3] {
              arm_place[2] = room_width + 32;
              arm_place[3] = room_height + 32;
              act[1] = floor(room_speed * 0.75);
              act[0] = 2;
       }
}

// Arm pauses for a moment
if act[0] = 2 {
       if act[1] != 0 {
              act[1] -= 1;
       } else {
              arm_index = 1;
              act[1] = room_speed;
              act[0] = 3;
       }
}

// Arm clentches food and pauses for a second
if act[0] = 3 {
       if act[1] != 0 {
              act[1] -= 1;
       } else {
              arm_index = 1;
              act[1] = room_speed * 0.25;
              act[0] = 4;
       }
}

// Arm pulls food back
// Transition to the next room after a moment
if act[0] = 4 {
       if act[1] != 0 {
              act[1] -= 1;
       } else {
              // room transition
              act[0] = -1;
              character = instance_create(room_width/2,-64,obj_player);
              character.state = "Intro";
              character.player_name = selected_char;
              character.persistent = 1;
              // room_goto_next();
              room_goto(room0); // The name of this room might change, so expect an error...
       }
       arm_place[0] += (arm_place[2] - arm_place[0]) * 0.05;
       arm_place[1] += (arm_place[3] - arm_place[1]) * 0.05;
}


