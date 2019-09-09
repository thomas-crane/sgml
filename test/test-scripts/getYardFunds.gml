///getYardFunds(object_yard_id)

if (instance_exists(object_buildman)){

    for (var i = 0; i < ds_list_size(object_buildman.buildingList); i++){
            
        var index = ds_list_find_value(object_buildman.buildingList, i);
        if (ds_map_find_value(index, "buildingObject") == argument[0]){
            return ds_map_find_value(index, "currentFunds");
        }
    }
    
}
