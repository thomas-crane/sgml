///deleteMarketCrew()
if (instance_exists(object_market)){
    for (var i = 0; i < ds_list_size(object_market.marketCrew); i++){
        ds_map_logdestroy(object_market.marketCrew[|i]);
    }
    ds_list_destroy(object_market.marketCrew);
}
