y -= 2;
if y < create_y - 32 {
       image_alpha -=0.05;
       if image_alpha <= 0 {
              instance_destroy();
       }
}

