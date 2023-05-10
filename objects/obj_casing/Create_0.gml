image_speed = 0;
image_angle = floor(random(360))+1;

float_amount = obj_player.move_speed;
// Add condition here to check if it's a casing or clip/magazine
// Clips/magazines are heavier and will not spin or move more than a casing
spin_dir = choose(0,1,-1);
spin_amount = 6 + floor(random(5));

// Regulating depth relative to Character
if instance_exists(obj_player) {
       depth = obj_player.depth + 1;
}

