///gotoCave(ds_map_cave)
var cave = argument0
if (instance_exists(object_game) && instance_exists(object_gridman)){

    log("Creating a new cave based on seed "+string(cave[? CAVE_SEED]));  

    room_goto(loading);
    
    var loader = instance_create(0,0, object_caveLoader);
    loader.cave = argument0;
    
    object_game.currentLevel = cave[? CAVE_LEVEL];
    
    maxStat('maxDepth', object_selectcave.depthUnit*object_game.currentLevel);
    
}
