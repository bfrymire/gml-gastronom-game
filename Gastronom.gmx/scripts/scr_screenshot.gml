// Saves the screen with a filename based on current time

// Setting month variable
var curr_month = current_month;
while string_length(string(curr_month)) < 2 {
       curr_month = "0" + string(curr_month);
}

// Setting day variable
var curr_day = current_day;
while string_length(string(curr_day)) < 2 {
       curr_day = "0" + string(curr_day);
}

// Setting hour variable
var curr_hour = current_hour;
while string_length(string(curr_hour)) < 2 {
       curr_hour = "0" + string(curr_hour);
}

// Setting minute variable
var curr_min = current_minute;
while string_length(string(curr_min)) < 2 {
       curr_min = "0" + string(curr_min);
}

// Setting the filename
var filename = "Gastronom_" + string(current_year) + "-" + string(curr_month) + "-" + string(curr_day) + "_" + string(curr_hour) + string(curr_min) + ".png";
// Saving the screen
screen_save(working_directory + string(filename));
// Sets clipboard to 'working_directory'
clipboard_set_text(string(working_directory));
