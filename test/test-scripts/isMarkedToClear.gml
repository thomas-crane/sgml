if (instance_exists(object_gravelman)){
    for (var i = 0; i < ds_list_size(object_gravelman.gravelObjectives); i++){
        var value = ds_list_find_value(object_gravelman.gravelObjectives, i);
        if (value[0] == argument0[0] && value[1] == argument0[1]){
            return true;
        }
    }
}
return false;
