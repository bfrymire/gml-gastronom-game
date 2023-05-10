player_names[0] = "broccoli";
player_names[1] = "donut";
player_names[2] = "corn";
player_names[3] = "tofu";
player_name = player_names[irandom_range(0, array_length(player_names) - 1)];

// Defining Character assets
scr_player_assets();

// Basic variables
move_speed = 4;
hp_max = 10;
hp = hp_max;

// Tweening image_angle
tangle_want = 15;
tangle_dir = 1;
can_tween = 0;

// Weapon system
ammo = ammo_max;
reload_time = 0;
reload_hud_alpha = 0;
can_shoot = 1;
shoot_time = 0;
gun_dir = 0;

// Other possible states: "Fall", "Land", "Jump", "Dead", "Intro"
state = "Begin_Intro";

// Temporary Invincibility after getting hit
can_get_hit = 1;
hit_time = 0;
hit_time_max = game_get_speed(gamespeed_fps) * 1; // change to after testing: game_get_speed(gamespeed_fps) * 0.5;
hit_flashes = 3; // Number of times the character will flash after hit

// Character Customization
eye_type = 0;

// Gun recoil
can_recoil = 0;
/* recoil[0,0] = 1; // recoil angle amount
recoil[0,1] = ; // recoil angle direction
recoil[1,0] = 125; // recoil angle max
recoil[1,1] = ; // recoil */
recoil_angle_max = 125;
recoil_amount = 0;
recoil_dir = 1;
recoil_max = 125;

/* */
/*  */
