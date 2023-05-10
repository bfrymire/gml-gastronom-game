// Drawing Player HUD

draw_sprite(spr_cursor,0,mouse_x,mouse_y);

if instance_exists(obj_player) {
       // Drawing Health
       /*var lollipop_xscale = -1;
       for(var i = 0; i < obj_player.hp; i++) {
              // double check this, I might be adding padding before the sprite is drawn
              // do the same for the bullets
              draw_sprite(spr_hud_heart,0,view_xview[0]+11+(sprite_get_width(spr_hud_heart)*i)+(2*i),view_yview[0]+12);
              lollipop_xscale *= -1;
              draw_sprite(spr_lollipop,0,view_xview[0]+11+(sprite_get_width(spr_hud_heart)*i)+(2*i),view_yview[0]+12);
       }*/
       // var half_hp = floor(obj_player.hp*0.5) + 1;
       for(var i = 0; i < floor(obj_player.hp * 0.5) + 1; i++) {
              if i != floor(obj_player.hp * 0.5) {
                     draw_sprite(spr_hud_heart,0,__view_get( e__VW.XView, 0 )+11+(sprite_get_width(spr_hud_heart)*i)+(2*i),__view_get( e__VW.YView, 0 )+12);
              } else {
                draw_sprite_part(spr_hud_heart,0,0,0,sprite_get_width(spr_hud_heart) * (obj_player.hp * 0.5 mod 1),sprite_get_height(spr_hud_heart),__view_get( e__VW.XView, 0 )+11+(sprite_get_width(spr_hud_heart)*i)+(2*i),__view_get( e__VW.YView, 0 )+12);
              }
       }
       scr_draw_text_outlined(__view_get( e__VW.XView, 0 )+11,__view_get( e__VW.YView, 0 )+12+32,"hp: " + string(obj_player.hp),1);
       scr_draw_text_outlined(__view_get( e__VW.XView, 0 )+11,__view_get( e__VW.YView, 0 )+12+64,"modified hp: " + string(floor(obj_player.hp*0.5)+1),1);
       //Drawing Bullets 17x19
       for(var i = 0; i < obj_player.ammo; i++) {
              var bullet_draw_x = __view_get( e__VW.XView, 0 )+17+sprite_get_xoffset(obj_player.hud_bullet_sprite);
              var bullet_draw_y = __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-20-sprite_get_yoffset(obj_player.hud_bullet_sprite)-(sprite_get_height(obj_player.hud_bullet_sprite)*i)-(9*i);
              draw_sprite(obj_player.hud_bullet_sprite,0,bullet_draw_x,bullet_draw_y);
       }
}

/* */
/*  */
