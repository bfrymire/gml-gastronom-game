if can_follow = 0 {
       if instance_exists(obj_controller) {
              if obj_controller.debug = 1 {
                     if mouse_check_button_pressed(mb_right) {
                            if mouse_x = clamp(mouse_x,x-sprite_width/2,x+sprite_width/2) && mouse_y = clamp(mouse_y,y-sprite_height/2,y+sprite_height/2) {
                                   can_follow = 1;
                            }
                     }
              }
       }
} else {
       x = mouse_x;
       y = mouse_y;
       if !mouse_check_button(mb_right) {
              can_follow = 0;
       }
}
if ai = 1 {
       // sprite_index = spr_;  /// post the sprite here
}

