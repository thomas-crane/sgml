///remStock(str_ressource, int_amount)
//Removes to the stock of THIS ressource, THIS amount.

if (instance_exists(object_stockman)){
    var stck = object_stockman.stocksMap
    var toRemove = argument[1];
    var amnt = ds_map_find_value(stck, argument[0]);
    if (is_undefined(amnt)){
        amnt = 0;
    }
    ds_map_replace(stck, argument[0], max(0, amnt-toRemove));
    if (amnt > 0 && argument[0] == "fuel"){
        refreshNRG();
    }
}
