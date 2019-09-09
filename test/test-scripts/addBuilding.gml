///addBuilding(object_building_, array_xy, *skin=sprite_yard)
if (instance_exists(object_buildman)){
    skin = sprite_building_yard;
    if (argument_count > 2){
        skin = argument[2];
    }
    var buildMap = ds_map_logcreate();
    var a1 = argument[1];
    
    ds_map_add(buildMap, "buildingObjective", argument[0]);
    ds_map_add_map(buildMap, "needs", getBuilding(argument[0], "needs"));
    var resList = getRessources();
    var cFund = ds_map_logcreate();
    for (var i = 0; i < array_length_1d(resList); i++){
        var needs = buildMap[? "needs"];
        if (needs[? resList[i]] > 0){
            ds_map_add(cFund, resList[i], 0);
        }
    }
    ds_map_add_map(buildMap, "currentFunds", cFund);
    
    
    var bO = instance_create(a1[0], a1[1], object_building_yard);
    bO.skin = skin;
    ds_map_add(buildMap, "buildingObject", bO);
    
    
    ds_list_add(object_buildman.buildingList, buildMap);
    ds_list_mark_as_map(object_buildman.buildingList, ds_list_size(object_buildman.buildingList)-1);
}

