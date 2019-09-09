///getTPCooldown(instance_object_building_)
if (instance_exists(object_teleportman)){
    var tpm = object_teleportman.teleportersCooldown;
    var found = ds_map_find_value(tpm, argument[0]);
    if (is_undefined(found)){
        found = 0;
    }
    return found;
}
