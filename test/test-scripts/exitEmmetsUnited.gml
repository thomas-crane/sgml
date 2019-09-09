///exitEmmetsUnited()
with (object_ui_window_eu){
    with (hostWindow){
        instance_destroy();
    }
    instance_destroy();
}
object_station.stationStep = STATION_HOME;

if (!object_game.offlineMode){
    onlineGetRanking(object_station.company[? "cid"]);
}

saveGameWindow();
