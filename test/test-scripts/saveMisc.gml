///saveMisc()
/// Saves miscellanous to disk

var misc = ds_map_logcreate();
ds_map_add(misc, "planet", object_selectcave.currentPlanet);
ds_map_add_list(misc, "caves", object_selectcave.availableCavesList);
ds_map_add_list(misc, "marketQueue", object_market.marketQueue);
ds_map_add_list(misc, "marketCrew", object_market.marketCrew);
ds_map_add_map(misc, "statistics", object_game.statistics);

log("Saving misc, is last cave ("+json_encode(object_game.lastCave)+") history ? : "+string(lastCaveIsHistory()));
if (!lastCaveIsHistory()){
    ds_map_add_map(misc, "lastCave", object_game.lastCave);
}
else{
    ds_map_add(misc, "lastCave", noone);
}

var stocksString = json_encode(misc);

misc[? "caves"] = noone;
misc[? "marketQueue"] = noone;
misc[? "marketCrew"] = noone;
misc[? "statistics"] = noone;
misc[? "planet"] = noone;
misc[? "lastCave"] = noone;
ds_map_logdestroy(misc);

writeFile(stocksString, "misc");
loadMisc();
