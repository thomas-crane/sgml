///getHardStock(str_ressource)
//Returns how many of THIS ressource the player currently has stocked in the ship

if (instance_exists(object_station)){
    var stck = object_station.stocks
    var amnt = ds_map_find_value(stck, argument[0]);
    if (is_undefined(amnt)){
        return 0;
    }
    else{
        return amnt;
    }
}
