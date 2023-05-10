draw_set_font(gm48_text_font);

var hover = point_in_rectangle(mouse_x,mouse_y,x-96,y-32,x+96,y+64);

// if the sprites are loaded
if (sprite_exists(logo_default)) and (sprite_exists(logo_mousein))
    {
    sw = lerp(string_width(string_hash_to_newline("Slide your mouse here")),string_width(string_hash_to_newline("Click to rate "+string(gm48_title))),alpha);
    
    if (x > __view_get( e__VW.WView, 0 )*0.65)
        {
        draw_set_halign(2);
        var dx = (x+88) + (alpha*8);
        
        if (alpha > 0)
            {
            draw_set_color(c_black);
            draw_set_alpha(alpha*gm48_text_outline);
            draw_rectangle(dx+16,(y-42) - 5*alpha,(dx+16) - (sw+32),(y+72) + 5*alpha,0);
            }
        }
    else if (x < __view_get( e__VW.WView, 0 )*0.35)
        {
        draw_set_halign(0);
        var dx = (x-88) - (alpha*8);
        
        if (alpha > 0)
            {
            draw_set_color(c_black);
            draw_set_alpha(alpha*gm48_text_outline);
            draw_rectangle(dx-16,(y-42) - 5*alpha,(dx-16) + (sw+32),(y+72) + 5*alpha,0);
            }
        }
    else
        {
        draw_set_halign(1);
        dx = x;
        
        if (alpha > 0)
            {
            draw_set_color(c_black);
            draw_set_alpha(alpha*gm48_text_outline);
            draw_rectangle(x - (sw/2 + 16),(y-42) - 5*alpha,x + (sw/2 + 16),(y+72) + 5*alpha,0);
            }
        }
    
    // mouse out
    if !(hover)
        {
        scale += (1.0-scale)*0.25;
        alpha += (0-alpha)*0.25;
        }
    else
    // mouse in
        {
        scale += (1.1-scale)*0.25;
        alpha += (1-alpha)*0.25;
        
        // link
        if (mouse_check_button_pressed(mb_left))
            url_open_ext(gm48_game_link,"_blank");
        }
    
    // mouse out
    if (alpha < 0.9)
        {
        // outlines
        if (gm48_text_outline > 0)
            {
            draw_sprite_ext(logo_default,0,x-1,y-1,scale,scale,0,c_black,(1-alpha)*gm48_text_outline);
            draw_sprite_ext(logo_default,0,x-1,y+1,scale,scale,0,c_black,(1-alpha)*gm48_text_outline);
            draw_sprite_ext(logo_default,0,x+1,y-1,scale,scale,0,c_black,(1-alpha)*gm48_text_outline);
            draw_sprite_ext(logo_default,0,x+1,y+1,scale,scale,0,c_black,(1-alpha)*gm48_text_outline);
            
            draw_set_color(c_black);
            draw_set_alpha((1-alpha)*gm48_text_outline);
            draw_text(dx-1,y+39 + alpha*5,string_hash_to_newline("Slide your mouse here"));
            draw_text(dx-1,y+41 + alpha*5,string_hash_to_newline("Slide your mouse here"));
            draw_text(dx+1,y+39 + alpha*5,string_hash_to_newline("Slide your mouse here"));
            draw_text(dx+1,y+41 + alpha*5,string_hash_to_newline("Slide your mouse here"));
            }
        
        // draw sprite
        draw_sprite_ext(logo_default,0,x,y,scale,scale,0,c_white,1);
        
        // draw text
        draw_set_color(c_white);
        draw_set_alpha((1-alpha));
        draw_text(dx,y+40 + alpha*5,string_hash_to_newline("Slide your mouse here"));
        }
    // mouse in
    if (alpha > 0.1)
        {
        // draw sprite
        draw_sprite_ext(logo_mousein,0,x,y,scale,scale,0,c_white,alpha);
        
        // text
        draw_set_color(c_white);
        draw_set_alpha(alpha);
        draw_text(dx,y+40 + alpha*5,string_hash_to_newline("Click to rate "+string(gm48_title)));
        }
    }
else
    {
    draw_set_halign(fa_center);
    
    // text outline
    if (gm48_text_outline > 0)
        {
        draw_set_color(c_black);
        draw_set_alpha(gm48_text_outline);
        draw_text(x-1,y+39,string_hash_to_newline("Loading..."));
        draw_text(x-1,y+41,string_hash_to_newline("Loading..."));
        draw_text(x+1,y+39,string_hash_to_newline("Loading..."));
        draw_text(x+1,y+41,string_hash_to_newline("Loading..."));
        }
    
    // text
    draw_set_color(c_white);
    draw_text(x,y+40,string_hash_to_newline("Loading..."));
    }

draw_set_halign(fa_left);
draw_set_color(c_black);
draw_set_alpha(1);

