// Deciding which way the Character is going to face

var eyes_sprite = spr_eyes;

// Change facing direction
if instance_exists(obj_player) {
       if obj_player.x > x {
              image_xscale = 1;
       } else image_xscale = -1;
}

// Deciding image_yscale of the gun
if gun_dir < 90 || gun_dir > 270 {
    var gun_yscale = 1;
} else var gun_yscale = -1;

// Draw outline only, then Character sprite
scr_draw_sprite_outline(sprite_index,0,x,y,image_xscale,1,image_angle,c_black,2);
draw_sprite_ext(sprite_index,0,x,y,image_xscale,1,image_angle,c_white,1);

// Drawing eyes
draw_sprite_ext(eyes_sprite,0,eye_origin_x,eye_origin_y,image_xscale,1,image_angle,c_white,1);

// Drawing Gun
draw_sprite_ext(gun_sprite,0,gun_origin_x,gun_origin_y ,1,gun_yscale,gun_dir,c_white,1);

