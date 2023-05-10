if spawn_time <= 0 {
       if instance_number(obj_enemy) <= 8 {
              place = choose(0,1,2,3,4,5);
              spawn_time = choose(game_get_speed(gamespeed_fps), game_get_speed(gamespeed_fps) * 2, game_get_speed(gamespeed_fps) * 1.5, game_get_speed(gamespeed_fps) / 2, game_get_speed(gamespeed_fps) * 0.85, game_get_speed(gamespeed_fps) * 3);
              switch(place) {
                     case 0:
                            instance_create(225,-70,obj_enemy);
                     case 1:
                            instance_create(112,-70,obj_enemy);
                     case 2:
                            instance_create(338,-70,obj_enemy);
                     case 3:
                            instance_create(90,720,obj_enemy);
                     case 4:
                            instance_create(270,720,obj_enemy);
                     case 5:
                            instance_create(360,720,obj_enemy);
                     default:
                            instance_create(room_width/2,-64,obj_enemy);
              }
    }
} else spawn_time -= 1;

