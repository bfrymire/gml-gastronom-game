for(var i = 0; i < array_length(food_char_list); i++) {
       if food_list[i,1] = 0 || act[0] < 3 {
              var place_x = room_width/2 + lengthdir_x(90,(360/array_length(food_char_list))*i);
              var place_y = plate_y + lengthdir_y(90,(360/array_length(food_char_list))*i);
              if food_list[i,0] = 1 {
                     // draw popup on hover
                     if act[0] = 0 {
                            draw_sprite(spr_player_popup,0,place_x - floor(sprite_get_width(spr_player_popup)/2),place_y - sprite_get_height(spr_player_popup) - 32);
                     }
              }
       }
}

