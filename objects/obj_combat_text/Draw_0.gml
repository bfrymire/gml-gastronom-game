draw_set_font(fnt_candal14);
draw_set_alpha(image_alpha);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_black);
for(var i = 0; i < 4; i++) {
       draw_text(x+lengthdir_x(2,90*i),y+lengthdir_y(2,90*i),string_hash_to_newline(string(damage)))
}
draw_set_color(c_white);
draw_text(x,y,string_hash_to_newline(string(damage)));
draw_set_color(c_black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_font(-1);

