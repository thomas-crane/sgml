///updateMarket()
if (object_game.offlineMode){

    /// Update resources
    var lowest = 0.3;
    var highest = 2;
    
    var list = object_market.marketQueue;
    var rscs = getFancyMaterials();
    var backStep = list[| ds_list_size(list)-1];
    
    var thisMap = ds_map_logcreate();
    
    for (var j = 0; j < array_length_1d(rscs); j++){
        var rsc = rscs[j];
        var lastValue = 1;
        if (backStep >= 0){
             lastValue =  backStep[? rsc];
        }
        value = updateMarketValue(highest, lowest, lastValue);
        thisMap[? rsc] = value;
    }
    if (ds_list_size(list) >= object_market.marketHistory){
        ds_map_logdestroy(list[| 0]);
        ds_list_delete(list, 0);
    }
    ds_list_add(list, thisMap);
    ds_list_mark_as_map(list, ds_list_size(list)-1);
    
    /// Update crew
    var marketCrew = object_market.marketCrew;
    if (ds_list_size(marketCrew) > 0){
        var toSave = marketCrew[| irandom(ds_list_size(marketCrew)-1)];
        for (var i = 0; i < ds_list_size(marketCrew); i++){
            var crewMember = marketCrew[| i];
            if (crewMember[? "eid"] == toSave[?"eid"]){
                continue;
            }
            else{
                ds_map_logdestroy(crewMember);
                ds_list_delete(marketCrew, i);
                i--;
            }
        }
    }
    for (var i = ds_list_size(marketCrew); i < OFFLINE_EMMETS; i++){
        ds_list_add(marketCrew, genEmmet(true));
        ds_list_mark_as_map(marketCrew,ds_list_size(marketCrew)-1);
    }
    
}
else{
    onlineGetMarket(object_market.marketHistory);
    onlineGetMarketCrew();
}

