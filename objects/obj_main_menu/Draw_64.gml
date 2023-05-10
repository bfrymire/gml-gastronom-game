// Draw black bars
draw_set_color(bar_color);
draw_rectangle(0,0,room_width,bar_height,0);
draw_rectangle(0,room_height,room_width,room_height+bar_height*-1,0);
var bar_height_ratio = min(bar_height,menu_grid[1,menu_index])/max(bar_height,menu_grid[1,menu_index]);

draw_set_color(c_white);
draw_text(mouse_x + 30,mouse_y - 30,string_hash_to_newline(string(volume_level[1,0])));

if menu_index != -1 {
       // Logo
       draw_sprite(spr_logo,0,floor(room_width/2-sprite_get_width(spr_logo)/2),32);
       
       // Display High Score
       draw_set_font(fnt_candal20);
       draw_set_color(c_white);
       draw_set_halign(fa_middle);
       draw_text(floor(room_width/2),32+sprite_get_height(spr_logo)+20,string_hash_to_newline("High Score: " + "N/A"));
       // Display Copyright
       draw_set_font(fnt_candal14);
       draw_sprite(spr_copyright,0,floor(room_width/2-string_width(string_hash_to_newline(" 2017 Twain"))/2-sprite_get_width(spr_copyright)/2),room_height-72+floor(sprite_get_height(spr_copyright)/2)+2);
       draw_text(floor(room_width/2),room_height-72,string_hash_to_newline("  2017 Twain#All rights reserved."));
       draw_set_halign(fa_left);
       draw_set_color(c_black);
       draw_set_font(-1);
       
       // Buttons
       var button_y_plus = 0;
       // Play Button
       if button_play_index = 2 {
              button_y_plus = 5;
       } else button_y_plus = 0;
       draw_sprite(spr_play,button_play_index,floor(room_width/2-sprite_get_width(spr_play)/2),32+sprite_get_height(spr_logo)+80+button_y_plus);
       // Options Button
       if button_options_index = 2 {
              button_y_plus = 5;
       } else button_y_plus = 0;
       draw_sprite(spr_options,button_options_index,63,447+button_y_plus);
       // Quit Button
       if button_quit_index = 2 {
              button_y_plus = 5;
       } else button_y_plus = 0;
       draw_sprite(spr_quit,button_quit_index,735,447+button_y_plus);
}
/*if menu_index = 1 {
       // OLD - Options menu start
       draw_set_font(fnt_candal20);
       draw_set_halign(fa_center);
       draw_set_color(c_white);
       draw_text(floor(room_width/2),32,"- Options -");
       draw_rectangle(32,32+string_height("- Options -")+32,room_width-32,room_height-32,1);
       draw_rectangle(32+1,32+string_height("- Options -")+32+1,room_width-32-1,room_height-32-1,1);
       // Regular options go here:
       draw_set_halign(fa_left);
} */

if options_height > 0 {
       var surf_width = 409;
       var surf_width_half = floor(surf_width/2)+1;
       var surf_height = 503;
       var text_height = 0;
       var padding_horizontal = 48;
       var height_ratio = min(options_height,surf_height)/max(options_height,surf_height);
       var surf = surface_create(surf_width,surf_height);
       // Draw Options Modal Fade
       draw_set_color(c_black);
       draw_set_alpha(height_ratio * 0.6);
       draw_rectangle(0,0,room_width,room_height,0);
       draw_set_alpha(1);
       draw_set_color(c_white);
       draw_text(15,15,string_hash_to_newline("Press Esc to go back."));
       // Draw Options Modal
       surface_set_target(surf);
       draw_clear_alpha(c_black,0);
       draw_sprite(spr_options_menu_top,0,0,0);
       draw_set_color(make_colour_rgb(64,64,64));
       draw_rectangle(0,sprite_get_height(spr_options_menu_top),surf_width,surf_height,0);
       // Draw exit button
       draw_sprite(spr_button_exit,0,surf_width-sprite_get_width(spr_button_exit)-12,12);
       // Draw "OPTIONS" text
       draw_set_halign(fa_center);
       draw_set_color(c_white);
       draw_set_font(fnt_strenuous40);
       text_height += 25;
       draw_text(floor(surf_width/2),text_height,string_hash_to_newline("OPTIONS"));
       text_height += string_height(string_hash_to_newline("OPTIONS")) + 33;
       if obj_controller.debug {
           draw_set_color(c_red);
           draw_line(0,text_height,room_width,text_height);
           draw_set_color(c_white);
       }
       // Draw "MUSIC" text
       draw_set_halign(fa_left);
       draw_set_font(fnt_strenuous22);
       draw_text(padding_horizontal,text_height,string_hash_to_newline("MUSIC"));
       // Draw music slider
       var slider_width = 16+102*volume_level[1,0];
       var slider_height = sprite_get_height(spr_volume_slider);
       var slider_x = surf_width-padding_horizontal-sprite_get_width(spr_volume_slider);
       var slider_y = 122+28-slider_height;
       draw_sprite(spr_volume_slider,0,slider_x,slider_y);
       if volume_level[2,0] = 0 {
              draw_sprite_part(spr_volume_slider,1,0,0,slider_width,slider_height,slider_x,slider_y);
       }
       // Draw music speaker
       if volume_level[2,0] = 1 || volume_level[1,0] = 0 {
              var speaker_index = 0;
       } else speaker_index = (sprite_get_number(spr_volume)-1)*volume_level[1,0];
       draw_set_alpha(0.45);
       draw_sprite(spr_volume,speaker_index,slider_x-8-sprite_get_width(spr_volume),122+floor(string_height(string_hash_to_newline("MUSIC"))/2-sprite_get_height(spr_volume)/2));
       draw_set_alpha(1);
       draw_sprite(spr_volume,speaker_index,slider_x-8-sprite_get_width(spr_volume),slider_y+sprite_get_height(spr_volume_slider)/2-sprite_get_height(spr_volume)/2);
       if speaker_index = 0 {
              draw_sprite(spr_volume_mute,0,slider_x-8-sprite_get_width(spr_volume),122+floor(string_height(string_hash_to_newline("MUSIC"))/2-sprite_get_height(spr_volume_mute)/2));
       }
       draw_set_font(-1);
       draw_text(slider_x-96,slider_y+96,string_hash_to_newline("volume_level[2,0]: " + string(volume_level[2,0]) + "#volume_level[1,0]: " + string(volume_level[1,0])));
       
       draw_set_color(c_red);
       draw_rectangle(slider_x-8-sprite_get_width(spr_volume),room_height-options_height+122+floor(string_height(string_hash_to_newline("MUSIC"))/2)-floor(sprite_get_height(spr_volume)/2),slider_x-8,room_height-options_height+122+floor(string_height(string_hash_to_newline("MUSIC"))/2)+floor(sprite_get_height(spr_volume)/2),1);
       
       surface_reset_target();
       draw_surface(surf,floor(room_width/2-surf_width/2),room_height-options_height);
       surface_free(surf);
}

// Draw cursor
scr_draw_sprite_outline(spr_cursor,0,mouse_x,mouse_y,1,1,1,c_black,2);
draw_sprite(spr_cursor,0,mouse_x,mouse_y);
if obj_controller.debug {
    draw_set_alpha(0.5);
    draw_set_color(c_red);
    draw_line(mouse_x,mouse_y-32,mouse_x,mouse_y+32);
    draw_line(mouse_x-32,mouse_y,mouse_x+32,mouse_y);
    draw_set_color(c_black);
    draw_set_alpha(1);
}

// Draw quit animation fading box
if quit_time > 0 {
       draw_set_color(c_black);
       draw_set_alpha(quit_time / (room_speed * 1));
       draw_rectangle(0,0,room_width,room_height,0);
       draw_set_alpha(1);
}

/* */
/*  */
