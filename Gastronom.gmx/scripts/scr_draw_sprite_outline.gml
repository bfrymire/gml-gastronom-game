// scr_draw_sprite_outline(sprite_index,0,x,y,image_xscale,1,image_angle,c_black,2);
// argument0 = sprite_index
// argument1 = image_index
// argument2 = x
// argument3 = y
// argument4 = image_xscale
// argument5 = image_yscale
// argument6 = image_angle
// argument7 = outline_color
// argument8 = outline width
//
// This will only draw the ouline
//
if argument8 > 0 {
       for (var i = 0; i < argument8; i++) {
              for (var ii = 0; ii < 4; ii++) {
                     var place_x = argument2 + lengthdir_x(i+1,90*ii);
                     var place_y = argument3 + lengthdir_y(i+1,90*ii);
                     draw_sprite_ext(argument0,argument1,place_x,place_y,argument4,argument5,argument6,argument7,1);
              }
       }
}
