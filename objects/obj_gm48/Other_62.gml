var request_id = ds_map_find_value(async_load,"id");
var status = ds_map_find_value(async_load,"status");
var result = ds_map_find_value(async_load,"result");

// we have a reply to a request
if (status == 0) and (result != "")
    {
    // default logo
    if (request_id == game_title_req)
        {
        var json_map = json_decode(result);
        if (json_map != -1)
            {
            gm48_title = ds_map_find_value(json_map,"title");
            
            if (gm48_text_maxchar > 0)
                {
                if (string_length(gm48_title) > gm48_text_maxchar)
                    {
                    var temp_str = gm48_title;
                    for(var i=0; i<string_count(" ",gm48_title); i++;)
                        {
                        var pos = string_pos(" ",temp_str);
                        if (pos < gm48_text_maxchar+1)
                            temp_str = string_replace(temp_str," ","_");
                        else
                            continue;
                        }
                    
                    var pos = string_pos(" ",temp_str);
                    if (pos != 0)
                        {
                        gm48_title = string_copy(gm48_title,0,pos-1);
                        gm48_title = string(gm48_title)+"...";
                        }
                    }
                }
            
            ds_map_destroy(json_map);
            }
        }
    else if (request_id == logo_default_req)
        {
        if (logo_default == -1) and (file_exists(working_directory+"\\gm48logo_default.png"))
            logo_default = sprite_add(working_directory+"\\gm48logo_default.png",0,0,0,100,50);
        }
    // mouse in logo
    else if (request_id == logo_mousein_req)
        {
        if (logo_mousein == -1) and (file_exists(working_directory+"\\gm48logo_mousein.png"))
            logo_mousein = sprite_add(working_directory+"\\gm48logo_mousein.png",0,0,0,100,50);
        }
    }

