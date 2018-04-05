// scr_screen_shake_add(amount, duration);

if instance_exists(obj_controller) {
       if obj_controller.screen_shake_time = 0 {
              // Add condition here to check if it's a shotgun or not, if it is, then add more screen_shake_amount
              obj_controller.screen_shake_amount = argument0;
       }
       obj_controller.screen_shake_time = argument1;
}
