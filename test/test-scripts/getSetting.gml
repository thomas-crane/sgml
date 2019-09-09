///getSetting(str_setting)
if (instance_exists(object_game)){
    var actSets = object_game.settings;
    return ds_map_find_value(actSets, argument[0]);
}
