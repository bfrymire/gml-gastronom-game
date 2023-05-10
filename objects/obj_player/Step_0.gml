// Deciding which way the Character is going to face
if mouse_x > x {
       image_xscale = 1;
} else {
       image_xscale = -1;
}

// Refreshing Character Assets
scr_player_assets();

// Restricting ammo
if ammo > ammo_max {
       ammo = ammo_max;
}

// Intro State - When character is first spawned
if state = "Begin_Intro" {
       ammo = ammo_max;
       reload_time = 0;
       reload_hud_alpha = 0;
       can_shoot = 1;
       shoot_time = 0;
       hp = hp_max;
       x = room_width/2;
       y = -(floor(sprite_get_height(sprite_index) / 2) + 17);
       state = "Intro";
}
if state = "Intro" {
       y += move_speed * 0.75;
       if y >= room_height * 0.5 {
              state = "Fall"
       }
}

// Falling State
if state = "Fall" {
       if keyboard_check(ord("W")) {
              y -= move_speed * 1.25;
              if y - sprite_get_height(sprite_index)/2 < 0 {
                     y = sprite_get_height(sprite_index)/2;
              }
       }
       if keyboard_check(ord("S")) {
              y += move_speed * 0.75;
              if y + sprite_get_height(sprite_index)/2 > room_height {
                     y = room_height - sprite_get_height(sprite_index)/2;
              }
       }
       if keyboard_check(ord("D")) {
                /*if !place_meeting(x+move_speed,y,obj_wall) {
                    x += move_speed;
                }*/
                if x + move_speed + floor(sprite_get_width(sprite_index)/2) < room_width - 125 {
                     x += move_speed;
                } else {
                     //for( var i = 0 ; i < move_speed; i++ ) {
                            x = room_width - 125 - floor(sprite_get_width(sprite_index)/2);
                     //}
                }
       }
       if keyboard_check(ord("A")) {
            if x - move_speed - floor(sprite_get_width(sprite_index)/2) > 125 {
                     x -= move_speed;
                } else {
                     //for( var i = 0 ; i < move_speed; i++ ) {
                            x = 125 + floor(sprite_get_width(sprite_index)/2);
                     //}
                }
       }
}

// Dead state
if hp <= 0 {
       state = "Dead";
}
if state = "Dead" {
       if y > -64 {
              y -= move_speed * 1.25;
              // room_goto_transition(rm_gameover, transition.fade, 60);
       }
}

// Testing - toggle tween
if keyboard_check_pressed(ord("T")) {
       if can_tween = 1 {
              can_tween = 0;
       } else {
            can_tween = 1;
       }
}

// Possible states: "Fall", "Land", "Jump", "Dead", "Intro", "Begin_Intro"
if state != "Land" && state != "Dead" && state != "Jump" {
       // Tweening Character sprite
       if can_tween = 1 {
              if image_angle = tangle_want * tangle_dir {
                     tangle_dir *= -1;
              }
              image_angle += ((tangle_want * tangle_dir) - image_angle) * 0.2;
       }
}

// Pointing gun
// Maybe look into changing this to the tip of the gun later
gun_dir = point_direction(x,y,mouse_x,mouse_y);

// Pew Pew
if state != "Begin_Intro" && state != "Intro" && state != "Dead" {
       if can_shoot = 1 {
              if mouse_check_button(mb_left) {
                     if ammo > 0 {
                            if instance_exists(obj_controller) {
                                   obj_controller.stats[? "shots_fired"] += 1;
                            }
                            can_recoil = 1;
                            recoil_dir = 1;
                            recoil_amount = 0;
                            ammo -= 1;
                            can_shoot = 0;
                            audio_play_sound(gun_shoot_sound, 1, 0);
                            scr_screen_shake_add(7,5);
                            var gun_width = sprite_get_width(gun_sprite) - sprite_get_xoffset(gun_sprite);
                            var gun_height = sprite_get_height(gun_sprite) - sprite_get_yoffset(gun_sprite);
                            var bullet_place_x1 = gun_origin_x + lengthdir_x(gun_width,gun_dir);
                            var bullet_place_y1 = gun_origin_y + lengthdir_y(gun_width,gun_dir);
                            var bullet_place_x2 = bullet_place_x1 + lengthdir_x(floor(sprite_get_yoffset(gun_sprite)/2)+1,gun_dir+90*image_xscale);
                            var bullet_place_y2 = bullet_place_y1 + lengthdir_y(floor(sprite_get_yoffset(gun_sprite)/2)+1,gun_dir+90*image_xscale);
                            repeat (bullet_number) {
                                   var bullet = instance_create(bullet_place_x2,bullet_place_y2,obj_bullet);
                                   bullet.direction = gun_dir - (gun_shoot_angle * 0.5) + random(gun_shoot_angle);
                                   bullet.speed = bullet_speed;
                                   bullet.creator = object_get_name(object_index);
                                   bullet.sprite_index = bullet_sprite;
                                   bullet.damage = 1;
                            }
                            if gun_type != "revolver" {
                                   var casing = instance_create(gun_origin_x,gun_origin_y,obj_casing);
                                   casing.sprite_index = bullet_case;
                                   casing.direction = floor(random(360));
                                   casing.speed = random(5) + 0.1;
                            }
                     }
              }
       } else {
              shoot_time += 1;
              if shoot_time >= shoot_time_max {
                     shoot_time = 0;
                     can_shoot = 1;
              }
       }
}

// Gun recoil animation
if can_recoil = 1 {
       if recoil_dir = 1 {
              recoil_amount += recoil_max / 3;
              if recoil_amount >= recoil_max {
                     recoil_amount = recoil_max;
                     recoil_dir = -1;
              }
       } else {
              recoil_amount -= recoil_max / 15;
              if recoil_amount <= 0 {
                     recoil_amount = 0;
                     can_recoil = 0;
                     recoil_dir = 1;
              }
       }
}

// Reloading if you run out of ammo in clip
if ammo = 0 {
       reload_time += 1;
       if reload_time = 1 {
              audio_play_sound(snd_reload, 1, 0);
              if gun_type = "revolver" {
                     repeat (ammo_max) {
                            var casing = instance_create(x,y,obj_casing);
                            casing.sprite_index = bullet_case;
                            casing.direction = floor(random(360));
                            casing.speed = random(5) + 0.1;
                     }
              }
       }
       if reload_time >= reload_time_max {
              reload_time = 0;
              ammo = ammo_max;
              reload_hud_alpha = 1;
       }
} else {
       // Manual Reloading
       if keyboard_check_pressed(ord("R")) {
              if ammo != ammo_max {
                     ammo = 0;
              }
       }
       if reload_hud_alpha > 0 {
              reload_hud_alpha -= 0.03;
       }
}

// Temporary invincibility after getting hit
if can_get_hit = 0 {
       hit_time += 1;
       if hit_time >= hit_time_max {
              hit_time = 0;
              can_get_hit = 1;
       }
}

/* */
/*  */
