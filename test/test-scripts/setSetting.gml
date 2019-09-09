///setSetting(str_setting, value)
if (instance_exists(object_game)){
    var actSets = object_game.settings;
    ds_map_replace(actSets, argument[0], argument[1]);
    return true;
}
return false;
