// Draw Food on Plate
draw_sprite(spr_plate,0,room_width/2-floor(sprite_get_width(spr_plate)/2),190);

for(var i = 0; i < array_length(food_char_list); i++) {
       if food_list[i,1] = 0 || act[0] < 3 {
              switch(i) {
                     case 0:
                            var char_sprite = spr_broccoli;
                            var char_angle = 75;
                            break;
                     case 1:
                            var char_sprite = spr_corn;
                            var char_angle = 90;
                            break;
                     case 2:
                            var char_sprite = spr_tofu;
                            var char_angle = 90;
                            break;
                     case 3:
                            var char_sprite = spr_donut;
                            var char_angle = 90;
                            break;
              }
              var place_x = room_width/2 + lengthdir_x(90,(360/array_length(food_char_list))*i);
              var place_y = plate_y + lengthdir_y(90,(360/array_length(food_char_list))*i);
              if food_list[i,0] = 1 {
                     // draw the outline and popup on hover, else draw the outline
                     scr_draw_sprite_outline(char_sprite,0,place_x,place_y,1,1,char_angle,c_black,2);
                     if act[0] = 0 {
                            //draw_sprite(spr_player_popup,0,place_x - floor(sprite_get_width(spr_player_popup)/2),place_y - sprite_get_height(spr_player_popup) - floor(sprite_get_height(char_sprite)/2));
                     }
              // scr_char_shadow(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, shadow_length, max_alpha);
              } else {
                    scr_char_shadow(char_sprite,0,place_x,place_y+3,1,1,char_angle,5,35);
              }
              //} else draw_sprite_ext(char_sprite,0,place_x+5,place_y+5,1,1,char_angle,c_black,0.25);
              draw_sprite_ext(char_sprite,0,place_x,place_y,1,1,char_angle,c_white,1);
       }
}

//draw_sprite(spr_player_popup,0,place_x - floor(sprite_get_width(spr_player_popup)/2),place_y - 5 - sprite_get_height(spr_player_popup));



// Draw Hand
//var arm_x = mouse_x+lengthdir_x(sprite_get_width(spr_arm)-sprite_get_xoffset(spr_arm),300);
//var arm_y = mouse_y+lengthdir_y(sprite_get_height(spr_arm)-sprite_get_yoffset(spr_arm),300);
if instance_exists(obj_controller) {
       if obj_controller.debug = 1 {
              draw_text(arm_place[0],arm_place[1]-35,string_hash_to_newline(string(arm_place[1])));
       }
}
draw_sprite_ext(spr_arm,arm_index,arm_place[0]+15,arm_place[1]+15,1,1,120,c_black,0.25);
draw_sprite_ext(spr_arm,arm_index,arm_place[0],arm_place[1],1,1,120,c_white,1);

// Draw "Select Player" banner
draw_sprite(spr_player_banner,0,room_width/2-floor(sprite_get_width(spr_player_banner)/2),32);



