///getStock(str_ressource)
//Returns how many of THIS ressource the player currently has
// This includes ingame stocker only, except for buildings

if (instance_exists(object_stockman)){
    var stck = object_stockman.stocksMap
    var amnt = ds_map_find_value(stck, argument[0]);
    if (is_undefined(amnt)){
        return 0;
    }
    else{
        return amnt;
    }
}
