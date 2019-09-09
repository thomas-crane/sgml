///lastCaveIsHistory()
var mem = object_station.company[? "memories"];
if (is_undefined(mem)){
    return false;
}
var history = mem[? "history"];
if (is_undefined(history)){
    return false;
}

for (var i = 0; i < ds_list_size(history); i++){
    var cave = history[|i];
    if (cave[? CAVE_SEED] == object_game.lastCave[? CAVE_SEED]){
        return true;
    }
}
return false;
