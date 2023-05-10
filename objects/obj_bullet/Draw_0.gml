if sprite_index = spr_shotgun_bullet_head {
       var bullet_angle = 0;
} else var bullet_angle = direction;
draw_sprite_ext(sprite_index,0,x,y,1,1,bullet_angle,c_white,1);

