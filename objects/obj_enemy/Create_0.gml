image_speed = 0;     // Stopping animation

// All possible sprites
sprite_list[0] = spr_virus;
sprite_list[1] = spr_bacterium;
sprite_list[2] = spr_bacterium2;
sprite_list[3] = spr_bug;
sprite_list[4] = spr_cluster;

var list_number = floor(random(array_length(sprite_list))); // Randomly selecting a number from sprite_list[]
enemy = list_number + 1;                                       // Selecting the enemy
sprite_index = sprite_list[list_number];                       // Selecting the sprite
image_index = floor(random(image_number));                     // Randomly selecting an image index

/// Initializing variables used for visuals and shooting
gun_type = choose("pistol","revolver","rifle","shotgun");
gun_sprite = asset_get_index("spr_" + string(gun_type));
bullet_sprite = spr_pistol_bullet_head;
eye_origin_x = x + lengthdir_x(sprite_get_width(sprite_index)/2,image_angle + 73.30);
eye_origin_y = y + lengthdir_y(sprite_get_width(sprite_index)/2,image_angle + 73.30);
gun_origin_x = x + lengthdir_x(21.2,image_angle + 360 - 19.29);
gun_origin_y = y + lengthdir_y(21.2,image_angle + 360 - 19.29);
gun_shoot_sound = snd_pistol;
gun_shoot_angle = 0;
bullet_number = random_range(10, 35);
bullet_speed = random_range(1, 3);

hp_max = floor(random(4)) + 1;
hp = hp_max;

// Tweening image_angle
tangle_want = 15;
tangle_dir = 1;

// Weapon system
ammo_max = 7;
ammo = ammo_max;
reload_time = 0;
reload_time_max = room_speed * 1;
gun_dir = 0;
can_shoot = 0;
shoot_time = 0;
// Previous shoot_time_max set by Stein
shoot_time_max = choose(room_speed * 0.45, room_speed * 0.3, room_speed * 0.5, 10);
// shoot_time_max = 15;     // Original shoot_time_max

/// Movement
switch (enemy) {
       case 1:
              move_speed = 1.2;
              move_speed_add = 0.3;
              break;
       case 2:
              move_speed = 0.2;
              move_speed_add = 0;
       case 3:
              move_speed = 2.7;
              move_speed_add = 0.3;
       case 4:
              move_speed = 1;
              move_speed_add = 0.5;
       case 5:
              move_speed = 1.6;
              move_speed_add = 0.3;
       default:
              move_speed = 1;
              move_speed_add = 0;
}
// Scaling up move_speed based on image_index
move_speed += move_speed_add * image_index;

