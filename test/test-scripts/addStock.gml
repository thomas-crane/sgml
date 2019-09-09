///addStock(str_ressource, *int_amount=1)
//Adds to the stock of THIS ressource, THIS amount.

if (instance_exists(object_stockman)){
    var stck = object_stockman.stocksMap
    var amnt = ds_map_find_value(stck, argument[0]);
    var actual = 0;
    if (!is_undefined(amnt)){
        actual = amnt;
    }
    if (argument_count > 1){
        actual += argument[1];
    }
    else{
        actual += 1;
    }
    ds_map_replace(stck, argument[0], actual);
    if (actual > 0 && argument[0] == "fuel"){
        refreshNRG();
    }
}
