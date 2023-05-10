// Make sure there's only 1 controller object
if instance_number(obj_controller) > 1 {
    instance_destroy();
}

debug = false; // Testing only, make debug = -1 to disable debugging mode
randomize(); // Randomize seed
sound_volume(all, 0.5); // Force lower volume during testing

// Play looping music
// I think this should be put at the beginning of the game level
// audio_play_sound(snd_ouroboros, 1, 1);

/*menu_level[0] = 0;   // Current menu level
menu_level[1] = 0;   // Menu index you were on before going into a submenu level
menu_level[3] = 0;   // This will save the previous menu_level[0] once going to a sub_level

volume_master = 1;   // Volume level of all sounds
volume_music = 1;    // Volume level for just music
volume_sound = 1;    // Volume level for just sound effects
volume_mute = 0;     // Boolean for muting all sounds*/


// Creating walls
if room = room0 {
       var wall = instance_create(0,0,obj_wall);
       wall.image_yscale = room_height / sprite_get_height(wall.sprite_index);
       var wall = instance_create(room_width-sprite_get_width(spr_wall),0,obj_wall);
       wall.image_yscale = room_height / sprite_get_height(wall.sprite_index);
}

// Screen shake
screen_shake_time = 0;
screen_shake_amount = 0;

// Background variables
go_bg_alpha = 0;

// Button Hovers
can_button_hover = 0;
button_time = 0;

// Stats to show on Game Over screen
stats = ds_map_create();
stats[? "shots_fired"] = 0;
stats[? "shots_hit"] = 0;
stats[? "time_alive"] = 0;
stats[? "wave"] = 1;
stats[? "damage_dealt"] = 0;


/* */
/*  */
