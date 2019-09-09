///createStation(owner, name, funds, quote, color, crewSize)

if (instance_exists(object_station)){
    ds_map_logdestroy(object_station.company);
    ds_map_logdestroy(object_station.stocks);
    ds_list_destroy(object_station.crew);
    
    object_station.stocks = ds_map_logcreate();
    object_station.stocks[? object_building_stocker] = 1;
    object_station.stocks[? object_building_refinery] = 1;
    object_station.stocks[? object_building_uplinker] = 1;
    object_station.stocks[? object_building_predeployed_battery] = 1;
    
    object_station.company = createCompany(argument0, argument1, argument2, argument3, argument4);
    object_station.crew = createCrew(argument5);
    object_station.companyLoaded = true;
    
    initializeMarket(object_market.marketHistory);
    populateCaveSelector();
    
    log("Created station with company "+object_station.company[? "name"]);
}
