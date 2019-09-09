///deleteMarketQueue()
if (instance_exists(object_market)){
    for (var i = 0; i < ds_list_size(object_market.marketQueue); i++){
        ds_map_logdestroy(object_market.marketQueue[|i]);
    }
    ds_list_destroy(object_market.marketQueue);
}
