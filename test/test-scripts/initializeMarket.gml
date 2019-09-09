///initializeMarket(int_historySize)

if (object_game.offlineMode){

    deleteMarketQueue();
    deleteMarketCrew();
    object_market.marketQueue = ds_list_create();
    object_market.marketCrew = ds_list_create();
    
    var marketHistory = argument0;
    var rscs = getFancyMaterials();
    for (var i = 0; i < marketHistory; i++){
        updateMarket()
    }
}
else{
    onlineGetMarket(object_market.marketHistory);
}
