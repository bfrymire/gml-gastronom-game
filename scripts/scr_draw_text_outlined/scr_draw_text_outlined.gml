function scr_draw_text_outlined(argument0, argument1, argument2, argument3) {
	draw_set_color(c_black);
	for ( i=-argument3 ; i < argument3+1 ; i++ ) {
	       for ( j=-argument3 ; j < argument3+1 ; j++ ) {
	              draw_text(argument0+i,argument1+j,string_hash_to_newline(argument2));
	       }
	}
	draw_set_color(c_white);
	draw_text(argument0,argument1,string_hash_to_newline(argument2));
	draw_set_color(c_black);



}
