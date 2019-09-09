///remYard(object_yard_id)

if (instance_exists(object_buildman)){

    for (var i = 0; i < ds_list_size(object_buildman.buildingList); i++){
            
        var index = ds_list_find_value(object_buildman.buildingList, i);
        if (ds_map_find_value(index, "buildingObject") == argument[0]){
            var objective = index[? "buildingObjective"];
            var brscs = getBuildingMaterials();
            for (var j =0; j < array_length_1d(brscs); j++){
                var brsc = brscs[j];
                var object = getRessource(brsc, "object");
                with (object){
                    if (partOfBuilding == argument[0]){
                        partOfBuilding = noone;
                    }
                }
            }
            ds_map_logdestroy(index);
            ds_list_delete(object_buildman.buildingList, i);
            instance_destroy(argument[0]);
            return false;
        }
    }
    
}
