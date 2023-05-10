// initiate variables
act[0] = 0;
act[1] = 0;
for(var i = 0; i < 4; i++) {
       for(var ii = 0; ii < 2; ii++) {
              // food_list[0,0] = hovered
              // food_list[0,1] = selected
              food_list[i, ii] = 0;
       }
       arm_place[i] = 0;
}
food_char_list[0] = "broccoli";
food_char_list[1] = "corn";
food_char_list[2] = "tofu";
food_char_list[3] = "donut";
selected_char = food_char_list[0];
arm_index = 0;

plate_x = room_width/2 - floor(sprite_get_width(spr_plate)/2);
plate_y = 190 + floor(sprite_get_height(spr_plate)/2);

