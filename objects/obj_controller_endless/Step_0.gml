wave = 1;
can_spawn = 1;
num_enemies = 3;
spawn_delay = 5;
wave_delay_max = game_get_speed(gamespeed_fps) * 3;
wave_delay = 0

// Can spawn
if can_spawn = 1 {
       if !instance_exists(obj_enemy) {
              num_enemies += 1;
       }
} else {
       // Can't spawn
       wave_delay += 1;
       if wave_delay = wave_delay_max {
              wave_delay = 0;
              can_spawn = 1;
       }
}

