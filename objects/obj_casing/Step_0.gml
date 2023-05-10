// Spin the shell
image_angle += spin_amount * spin_dir;

// Destroy if outside the top of the room
if y < __view_get( e__VW.YView, 0 ) - max(sprite_get_width(sprite_index),sprite_get_height(sprite_index)) - 1 {
       instance_destroy();
}

// Float upwords increasingly faster
vspeed -= 0.15;

// Horizontal speed decay
if hspeed != 0 {
       hspeed += -hspeed * 0.05;
}

