///unmarkGravelToClear(array_iso_index)
if (instance_exists(object_gravelman)){
    var delpos = noone;
    for (var i = 0; i < ds_list_size(object_gravelman.gravelObjectives); i++){
        var content = ds_list_find_value(object_gravelman.gravelObjectives, i);
        var toSearch = argument[0];
        if (content[0] == toSearch[0] &&
            content[1] == toSearch[1]){
            
            ds_list_delete(object_gravelman.gravelObjectives, i);
            revertGroundColor(toSearch);
            return true;
        }
    }
}
