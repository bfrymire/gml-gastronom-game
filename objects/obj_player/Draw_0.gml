scr_player_assets();

// Deciding which way the Character is going to face
if state != "Dead" {
       var eyes_sprite = spr_eyes;
       if mouse_x > x {
              image_xscale = 1;
       } else {
            image_xscale = -1;
       }
} else {
       var eyes_sprite = spr_eyes_dead;
}

// Deciding image_yscale of the gun
if gun_dir < 90 || gun_dir > 270 {
       var gun_yscale = 1;
} else {
       var gun_yscale = -1;
}

// Character will falsh while invincible
if can_get_hit = 0 {
       var flash_mod = floor(hit_time_max / (hit_flashes)) + 1;
       if hit_time mod flash_mod < flash_mod / 2 {
              can_draw_char = 0;
       } else can_draw_char = 1;
} else can_draw_char = 1;

if can_draw_char = 1 {
       scr_draw_sprite_outline(sprite_index,0,x,y,image_xscale,1,image_angle,c_black,2);          // Outline only
       draw_sprite_ext(sprite_index,0,x,y,image_xscale,1,image_angle,c_white,1);                  // Character sprite only
       // Drawing eyes
       // old eye code - draw_sprite_ext(eyes_sprite,0,x + (image_xscale * eye_origin_x),eye_origin_y,image_xscale, 1,image_angle,c_white,1);  // Eyes sprite only
       if eye_type = 0 {
              draw_sprite_ext(eyes_sprite,0,eye_origin_x,eye_origin_y,1,1,image_angle,c_white,1);        // Eyes sprite only
       } else {
            if eye_type = 1 {
              var eye;
            }
       }
       
       // Drawing eyes - Feature got ICED!!
       /*var eye_pos1_x = x+lengthdir_x(floor(sprite_get_width(sprite_index)*0.25),image_angle+90);
       var eye_pos1_y = y+lengthdir_y(floor(sprite_get_height(sprite_index)*0.25),image_angle+90);
       var eye_pos2_x = eye_pos1_x+lengthdir_x(floor(sprite_get_width(sprite_index)*0.25),image_angle+90);
       var eye_pos2_y = eye_pos1_y+lengthdir_y(floor(sprite_get_height(sprite_index)*0.25),image_angle+90);
       var eye_pos3_x = eye_pos2_x+lengthdir_x(floor(sprite_get_width(sprite_index)*0.25),image_angle+90);
       var eye_pos3_y = eye_pos2_y+lengthdir_y(floor(sprite_get_height(sprite_index)*0.25),image_angle+90);*/
       // Drawing **SPECIAL EYES** // Feature got ICED!!
       // draw_sprite(spr_eye,0,eye_pos3_x,eye_pos3_y);
       
       // Drawing Gun
       if state != "Flip" && state != "Dead" {
              if reload_time != 0 {
                     gun_index = sprite_get_number(gun_sprite)-1;
              } else gun_index = 0;
              draw_sprite_ext(gun_sprite,gun_index,gun_origin_x,gun_origin_y ,1,gun_yscale,gun_dir+recoil_amount*image_xscale,c_white,1);
       }
}

// Drawing reload circle
if reload_time != 0 {
       // draw_sprite_ext(spr_hud_reload,0,x,y-floor(sprite_get_height(sprite_index)/2)-6,1,1,0,c_white,1);
       draw_sprite_ext(spr_hud_reload,(reload_time/reload_time_max)*sprite_get_number(spr_hud_reload),x,y-floor(sprite_get_height(sprite_index)/2)-6,1,1,0,c_white,1);
} else if reload_hud_alpha > 0 {
       draw_sprite_ext(spr_hud_reload,sprite_get_number(spr_hud_reload)-1,x,y-floor(sprite_get_height(sprite_index)/2)-6,1,1,0,c_white,reload_hud_alpha);
}

if instance_exists(obj_controller) {
       if obj_controller.debug {
       
              //draw_text(x+32,y-32,string(hit_time_max) + " / " + string(hit_time));
              //if !can_get_hit draw_text(x+32,y-16,string(math));
              
              draw_set_color(c_white);
              
              var debug_text = "";
              debug_text += string(hit_time_max) + " / " + string(hit_time) + "#";
              if !can_get_hit {
                     debug_text += string(hit_time mod floor(hit_time_max / (hit_flashes * 2))+1) + "#";
              } else {
                    debug_text += "0#";
              }
              //debug_text += string((hit_time_max-hit_time) / (hit_time_max/hit_flashes)) + "#";
              //debug_text += string(hit_time mod hit_flashes) + "#"; // this worked... sort of...
              //debug_text += string(hit_time_max/hit_flashes) + "#";
              
              
              if debug_text != "" {
                     draw_text(x+32,y-32,string_hash_to_newline(string(debug_text)));
              }
              
              draw_text(x+65,y,string_hash_to_newline(string(x)));
              
              draw_set_color(c_black);
       }
}

/* */
/*  */
