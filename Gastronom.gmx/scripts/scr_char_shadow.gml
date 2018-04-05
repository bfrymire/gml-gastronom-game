// This is designed to create a soft shadow under the characters in the character select screen
//
// scr_char_shadow(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, shadow_length, max_alpha);
//

for(var i = 0; i < 4; i++) {
       draw_sprite_ext(argument0,argument1,argument2 + lengthdir_x(argument7,90*i),argument3 + lengthdir_y(argument7/2,90*i),argument4,argument5,argument6,c_black,(argument8*0.01)/4);
}
