///liberateRsc(ds_map_ressources, instance_building_)
//Liberates on the ground these ressources from this building
    
    
    var toSpawn = ds_map_logcreate();
    var needs = argument[0];
    var building = argument[1];
    var rsc = getBuildingMaterials();
    
    for (var i = 0; i < array_length_1d(rsc); i++){
        var thisNeed = ds_map_find_value(needs, rsc[i]);
        if (is_undefined(thisNeed) || thisNeed == noone){
            thisNeed = 0;
        }
        var stockBefore = getStock(rsc[i]);
        
        remStock(rsc[i], thisNeed);
        var stockAfter = getStock(rsc[i]);
        
        ds_map_add(toSpawn, rsc[i], stockBefore-stockAfter);
    }
    dropRsc(toSpawn, building);
    ds_map_logdestroy(toSpawn);
    return true;
