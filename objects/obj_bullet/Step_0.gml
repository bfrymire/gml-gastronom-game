// Destroy outside of room
if x != clamp(x,-32,room_width+32) || y != clamp(y,-32,room_height+32) {
       instance_destroy();
}

// Destroy if nobody created it
if creator = -1 {
       instance_destroy();
}

