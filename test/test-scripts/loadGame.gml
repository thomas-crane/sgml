///loadGame()
var load = (loadCompany() && loadCrew() && loadStocks() && loadMisc());
if (load){
    object_station.color = object_station.company[? "color"];
    object_station.companyLoaded = true;
    var mem = object_station.company[? "memories"];
    var history = mem[? "history"];
    
    // Updating level and last cave
    if (object_game.lastCave == noone && ds_list_size(history) > 0){
        object_game.lastCave = history[| ds_list_size(history)-1];
        log("Set last cave to last history element, therefore "+json_encode(object_game.lastCave)+"");
    }
    
    if (isValidCave(object_game.lastCave)){
        object_game.currentLevel = object_game.lastCave[? CAVE_LEVEL];
    }
    else{
        object_game.currentLevel = 1;
    }
    
    log("Finished loading, current level is "+string(object_game.currentLevel));
}
else{
    object_station.companyLoaded = false;
}
return load;
