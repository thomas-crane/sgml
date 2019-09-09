///populateCaveSelector(*caveList)
with (object_selectcave){

    if (ds_list_size(availableCavesList) > 1){
        for (var i = 0; i < ds_list_size(availableCavesList); i++){
            var caveMap = ds_list_find_value(availableCavesList, i);
            if (object_game.lastCave == caveMap){
                availableCavesList[|i] = noone;
            }
            else{
                ds_list_mark_as_map(availableCavesList, i);
                log("Marking cave ["+string(caveMap)+"] for deletion");
            }
        }
    }
    ds_list_destroy(availableCavesList);
    
    if (argument_count > 0){
        var list = argument[0];
        log("Setting available caves list to a "+string(ds_list_size(list))+" sized list of value ["+string(list[|0])+"] "+json_encode(list[|0])+" and ["+string(list[|1])+"] "+json_encode(list[|1])+"");
        availableCavesList = argument[0];
        log("Last cave is ["+string(object_game.lastCave)+"] "+json_encode(object_game.lastCave));
    }
    else{
        if (!ds_exists(object_game.lastCave, ds_type_map) || is_undefined(object_game.lastCave[? CAVE_SEED])){
            object_game.lastCave = createRandomCave(1);
            log("Could not find last cave. From game ender, set last cave to ["+string(object_game.lastCave)+"] "+json_encode(object_game.lastCave));
        }
        log("Forking last cave ["+string(object_game.lastCave)+"] "+json_encode(object_game.lastCave));
        availableCavesList = forkCave(object_game.lastCave);
    }
}
