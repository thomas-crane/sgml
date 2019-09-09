///destroyCompany()
if (!object_game.offlineMode){
    var crewMap = ds_map_logcreate();
    ds_map_add_list(crewMap, 'default', object_station.crew);
    onlineSendCrew(json_encode(crewMap));
    onlineKillCompany(object_station.company[? "cid"]);
    ds_map_logdestroy(crewMap);
}
else{
    ds_list_destroy(object_station.crew);
}
ds_map_logdestroy(object_station.company);
ds_map_logdestroy(object_station.stocks);
destroySavegame();
with(object_ui_window){
    closeWindow(id);
}
var load = loadGame();
if (load){
    object_station.color = object_station.company[? "color"];
}
else{
    object_station.color = DEFAULT_COLOR;
}
object_station.companyLoaded = load;

createWindow(
    translate("GENERAL_UI", "notice"),
    translate("LIQUIDATION", "niceRun")+"##"+formatStatistics(object_game.statistics)
    );
playSfx(sound_sfx_crowd_cheer);
log(json_encode(object_game.statistics));
ds_map_logdestroy(object_game.statistics);
initializeStatistics();
