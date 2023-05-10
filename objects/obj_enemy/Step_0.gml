// Destory if out of health
if hp <= 0 {
    instance_destroy();
}

// Pointing gun
// Maybe look into changing this to the tip of the gun later
if instance_exists(obj_player) {
       if obj_player.hp > 0 {
              gun_dir = point_direction(x,y,obj_player.x,obj_player.y);
       }
}

// Pew Pew
if can_shoot = 1 {
       can_shoot = 0;
       // audio_play_sound(gun_shoot_sound, 1, 0);      // Enemies can't make noise, it would be too much
       // scr_screen_shake_add(7,5);                    // Enemies can't shake the screen, it would be too much
       repeat (bullet_number) {
              var bullet = instance_create(x+lengthdir_x(sprite_get_width(gun_sprite)-sprite_get_xoffset(gun_sprite),gun_dir),y+lengthdir_y(sprite_get_height(gun_sprite)-sprite_get_yoffset(gun_sprite),gun_dir),obj_bullet);
              bullet.direction = gun_dir - (gun_shoot_angle * 0.5) + random(gun_shoot_angle);
              bullet.speed = bullet_speed;
              bullet.creator = object_get_name(object_index);
              bullet.sprite_index = bullet_sprite;
              bullet.damage = 1;
       }
       if gun_type != "revolver" or gun_type != "shotgun" {
              var casing = instance_create(x,y,obj_casing);
              casing.direction = floor(random(360));
              casing.speed = random(5) + 0.1;
       }
} else {
       shoot_time += 1;
       if shoot_time >= shoot_time_max {
              shoot_time = 0;
              can_shoot = 1;
       }
}

// Movement towards player if they exist
if instance_exists(obj_player) {
    if obj_player.hp > 0 {
        mp_potential_step(obj_player.x, obj_player.y, move_speed, 0);
    } else mp_potential_step(x, room_height+250, move_speed, 0);
} else {
       mp_potential_step(x, room_height+250, move_speed, 0);
       if y >= room_height + 250 {
              instance_destroy();
       }
}

