///getBuilding(object_building_, str_need)

var rArr = getRessources();
var sprite = sprite_building_dummy;
var needs = ds_map_logcreate();
var size = 1;
var name = translate(BUILDING, object_get_name(argument0));

for (var i = 0; i < array_length_1d(rArr); i++){
    ds_map_add(needs, rArr[i], 0);
}

switch (argument0){
    default:
        break;
        
    case object_ground_pathway:
        ds_map_replace(needs, "junk", 3);
        sprite = sprite_ground_pathway;
        break;
        
    case object_building_stocker:
        ds_map_replace(needs, "junk", 10);
        sprite = sprite_building_stocker;
        break;
        
    case object_building_refinery:
        ds_map_replace(needs, "junk", 10);
        ds_map_replace(needs, "metal", 7);
        ds_map_replace(needs, "fuel", 1);
        sprite = sprite_building_refinery;
        break;
        
    case object_building_uplinker:
        ds_map_replace(needs, "metal", 5);
        ds_map_replace(needs, "fuel", 1);
        sprite = sprite_building_uplinker;
        break;
        
    case object_building_predeployed_battery:
        ds_map_replace(needs, "fuel", 4);
        sprite = sprite_building_predeployed_battery;
        break;
        
    case object_building_powerplant:
        ds_map_replace(needs, "junk", 20);
        ds_map_replace(needs, "fuel", 3);
        ds_map_replace(needs, "metal", 10);
        size = 2;
        sprite = sprite_building_powerplant;
        break;
        
    case object_building_stabilizer:
        ds_map_replace(needs, "junk", 2);
        ds_map_replace(needs, "metal", 4);
        ds_map_replace(needs, "fuel", 2);
        sprite = sprite_building_station;
        break;
        
    /*
    case object_building_toolstore:
        sprite = sprite_building_toolstore;
        break;
        
    case object_building_teleramp:
        ds_map_replace(needs, "ore", 8);
        sprite = sprite_building_teleramp;
        break;
        
    case object_building_station:
        ds_map_replace(needs, "ore", 15);
        ds_map_replace(needs, "crystal", 4);
        sprite = sprite_building_station;
        break; 
        
    case object_building_sismic:
        ds_map_replace(needs, "ore", 6);
        ds_map_replace(needs, "crystal", 2);
        sprite = sprite_building_sismic;
        break;
    */
}
switch (argument1){
    default:
        return needs;
        break;
        
    case "sprite" :
        ds_map_logdestroy(needs);
        return sprite;
        break;
        
    case "size":
        ds_map_logdestroy(needs);
        return size;
        break;
        
    case "name":
        ds_map_logdestroy(needs);
        return name;
        break;
        
    case "price":
        ds_map_logdestroy(needs);
        return getBuildingPrice(argument0);
        break;
}
