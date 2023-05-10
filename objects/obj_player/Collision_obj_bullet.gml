if can_get_hit = 1 {
       if other.creator != object_get_name(object_index) {
              can_get_hit = 0;
              hp -= other.damage;
              instance_destroy(other);
       }
}

