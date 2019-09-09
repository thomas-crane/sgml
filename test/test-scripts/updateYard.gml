///updateYard(object_yard_id, ds_map_funds)

if (instance_exists(object_buildman)){
    for (var i = 0; i < ds_list_size(object_buildman.buildingList); i++){
        var index = ds_list_find_value(object_buildman.buildingList, i);
        if (ds_map_find_value(index, "buildingObject") == argument[0]){
            ds_map_replace(index, "currentFunds", argument[1]);
            return true;
        }
    }
}
return false;
