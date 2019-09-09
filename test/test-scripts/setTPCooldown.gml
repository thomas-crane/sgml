///setTPCooldown(object_building_, float_cd)
if (instance_exists(object_teleportman)){
    var tpm = object_teleportman.teleportersCooldown;
    var found = ds_map_find_value(tpm, argument[0]);
    if (is_undefined(found)){
        ds_map_add(tpm, argument[0], argument[1]);
    }
    else{
        ds_map_replace(tpm, argument[0], argument[1]);
    }
}
