///produceBuilding(object_building_)
if (instance_exists(object_buildingproducer)){
    if (is_undefined(object_buildingproducer.productionMap[? argument0])){
        var rscs = getBuildingMaterials();
        var cost = getBuilding(argument0, "needs");
        for (var i = 0; i < array_length_1d(rscs); i++){
            var rsc = rscs[i];
            if (cost[? rsc] > 0){
                remStock(rsc, cost[? rsc]);
            }
        }
        ds_map_logdestroy(cost);
        object_buildingproducer.productionMap[? argument0] = 0;
    }
}
