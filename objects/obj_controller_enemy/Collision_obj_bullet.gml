if other.creator != object_get_name(object_index) {
       if instance_exists(obj_controller) {
              obj_controller.stats[? "shots_hit"] += 1;
              obj_controller.stats[? "damage_dealt"] += other.damage;
       }
       hp -= other.damage;
       var combat_text = instance_create(x, y - sprite_get_height(sprite_index) / 2, obj_combat_text);
       combat_text.damage = abs(other.damage);
       instance_destroy(other);
}

