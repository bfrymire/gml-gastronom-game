function scr_player_assets() {
	// Defining Player Assets
	switch (player_name) {
	       // Also add screen shake amount
	       // Also add bullet angle randomization
       
	       // recoil_amount = 15;
	       // recoil_dir = 0; // 0 = angled; 1 = lengthdir
       
       
	       case "broccoli":
	              sprite_index = spr_broccoli;
	              gun_type = "rifle";
	              gun_sprite = spr_rifle;
	              ammo_max = 3;
	              reload_time_max = room_speed * 1;
	              shoot_time_max = 15;
	              bullet_sprite = spr_rifle_bullet_head;
	              bullet_case = spr_rifle_bullet_case;
	              hud_bullet_sprite = spr_rifle_bullet_full;
	              eye_origin_x = x + lengthdir_x(8.6,image_angle + 54.46 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              eye_origin_y = y + lengthdir_y(8.6,image_angle + 54.46 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_origin_x = x + lengthdir_x(16.4,image_angle + 360 - 52.43 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_origin_y = y + lengthdir_y(16.4,image_angle + + 360 - 52.43 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_shoot_sound = snd_rifle;
	              gun_shoot_angle = 15;
	              bullet_number = 1;
	              bullet_speed = 9;
	              break;
	       case "donut":
	              sprite_index = spr_donut;
	              gun_type = "revolver";
	              gun_sprite = spr_revolver;
	              ammo_max = 5;
	              reload_time_max = room_speed * 2.3;
	              shoot_time_max = 7;
	              bullet_sprite = spr_pistol_bullet_head;
	              bullet_case = spr_pistol_bullet_case;
	              hud_bullet_sprite = spr_pistol_bullet_full;
	              eye_origin_x = x + lengthdir_x(20.9,image_angle + 73.30 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              eye_origin_y = y + lengthdir_y(20.9,image_angle + 73.30 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_origin_x = x + lengthdir_x(21.2,image_angle + 360 - 19.29 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_origin_y = y + lengthdir_y(21.2,image_angle + 360 - 19.29 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_shoot_sound = snd_revolver;
	              gun_shoot_angle = 35;
	              bullet_number = 1;
	              bullet_speed = 5;
	              break;
	       case "corn":
	              sprite_index = spr_corn;
	              gun_type = "shotgun";
	              gun_sprite = spr_shotgun;
	              ammo_max = 2;
	              reload_time_max = room_speed * 1;
	              shoot_time_max = 15;
	              bullet_sprite = spr_shotgun_bullet_head;
	              bullet_case = choose(spr_shotgun_bullet_full,spr_shotgun_bullet_full_broken);
	              hud_bullet_sprite = spr_shotgun_bullet_full;
	              eye_origin_x = x + lengthdir_x(10,image_angle + 5.71 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              eye_origin_y = y + lengthdir_y(10,image_angle + 5.71 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_origin_x = x + lengthdir_x(18.8,image_angle + 360 - 64.80 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_origin_y = y + lengthdir_y(18.8,image_angle + + 360 - 64.80 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_shoot_sound = snd_shotgun;
	              gun_shoot_angle = 75;
	              bullet_number = 5;
	              bullet_speed = 4;
	              break;
	       case "tofu":
	              sprite_index = spr_tofu;
	              gun_type = "pistol";
	              gun_sprite = spr_pistol;
	              ammo_max = 12;
	              reload_time_max = room_speed * 1;
	              shoot_time_max = 15;
	              bullet_sprite = spr_pistol_bullet_head;
	              bullet_case = spr_pistol_bullet_case;
	              hud_bullet_sprite = spr_pistol_bullet_full;
	              eye_origin_x = x + lengthdir_x(20.6,image_angle + 22.83 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              eye_origin_y = y + lengthdir_y(20.6,image_angle + 22.83 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_origin_x = x + lengthdir_x(23.3,image_angle + 360 - 25.46 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_origin_y = y + lengthdir_y(23.3,image_angle + + 360 - 25.46 * image_xscale + 180 * clamp(-image_xscale,0,1));
	              gun_shoot_sound = snd_pistol;
	              gun_shoot_angle = 25;
	              bullet_number = 1;
	              bullet_speed = 5;
	              break;
	}



}
