///loadMisc()

var sum = getSum("misc");
if (is_undefined(sum)){
    log("Sum is missing from sumlist, could not load MISC", "LOADMISC");
    return false;
}
var filePath = object_disk.miscPath+"/"+sum;
var misc = readFile(filePath);

/// market
var marketQueue = misc[? "marketQueue"];
var marketCrew = misc[? "marketCrew"];

ds_list_destroy(object_market.marketQueue);
ds_list_destroy(object_market.marketCrew);

object_market.marketQueue = marketQueue;
object_market.marketCrew = marketCrew;

// Planet
var planet = misc[? "planet"];
if (planet != undefined){
    object_selectcave.currentPlanet = planet;
}
/// caves
var caves = misc[? "caves"];
if (caves != undefined){
    populateCaveSelector(caves);
}
else{
    populateCaveSelector();
    log("Undefined caves, generated a new. Last one is "+
        json_encode(object_selectcave.availableCavesList[|ds_list_size(object_selectcave.availableCavesList)-1]));
}

// Last cave
var lastCave = misc[? "lastCave"];
if (isValidCave(lastCave)){
    // Changed planet recently, last cave should be overriden
    log("Set last cave from savegame, from "+json_encode(object_game.lastCave)+" to "+json_encode(lastCave));
    object_game.lastCave = lastCave;
    misc[? "lastCave"] = noone;
    object_game.currentLevel = 1;
}
else{
    log("No last cave to load from misc : "+string(misc[? "lastCave"]));
}

/// Statistics
var stats =  misc[? "statistics"];
ds_map_logdestroy(object_game.statistics);
object_game.statistics = stats;

return true
