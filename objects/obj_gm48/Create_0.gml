/* ======================================== */
/* === CHANGE THESE BASED ON YOUR GAME! === */
/* ======================================== */


// the link to your submission's gm48.net page
// example: http://gm48.net/?page=game&id=53
// gm48_game_link = "http://gm48.net/?page=game&id=34"; // [OLD] Example game link
// gm48_game_link = "https://gm48.net/game/501/descend"
gm48_game_link = "https://gm48.net/game/501"

// leave this set to -1 for default font
gm48_text_font = -1;

// text outline [value of 0 (off) to 1 (full) intensity]
gm48_text_outline = 0.25;

// the max string length of your games title [0 = full text]
gm48_text_maxchar = 32;


/* ======================================== */
/* === DON'T CHANGE ANYTHING ELSE BELOW === */
/* ======================================== */

var pos = string_pos("/game/",gm48_game_link);


if (pos != 0)
    {
    // game details
    gm48_game_id = string_copy(gm48_game_link,pos+6,string_length(gm48_game_link));
    show_message(string(gm48_game_id));
    gm48_title = "descend";
    
    // http requests
    game_title_req   = http_get("http://gm48.net/api/?id="+string(gm48_game_id));
    logo_default_req = http_get_file("http://gm48.net/img/gm48.png",working_directory+"\\gm48logo_default.png");
    logo_mousein_req = http_get_file("http://gm48.net/img/gm48-white.png",working_directory+"\\gm48logo_mousein.png");
    
    // drawing modifiers
    scale = 1.1;
    alpha = 0;
    } else show_message(string("id not found"));

// logo sprites
logo_default = -1;
logo_mousein = -1;

/* */
/*  */
