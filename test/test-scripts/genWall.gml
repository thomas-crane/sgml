///genWall(TERRAIN_TYPE_, *ds_loot, *additiveLoot=false, *lootMultiplier)
var thisWall = ds_map_logcreate();
ds_map_add(thisWall, "hp", 100);
ds_map_add(thisWall, "solidity", 0);

var loot = noone;
var lootMultiplier = 1;

if (argument_count > 3){
    lootMultiplier = argument[3];
}

if (argument_count > 1 && 
    ds_exists(argument[1], ds_type_map) && 
    !is_undefined(argument[1]) &&
    (argument_count < 2 || !argument[2])){
    
    loot = argument[1];
}
else{
    loot = ds_map_logcreate();
    switch argument[0]{
        case TERRAIN_WALL_DIRT:
            ds_map_add(loot, "roughJunk", floor(rrandom(3)));
            ds_map_add(loot, "roughMetal", floor(rrandom(1))*(lootMultiplier));
            ds_map_add(loot, "roughFuel", floor(clamp(rrandom(5)-4, 0, 1))*lootMultiplier);
            break;
            
        case TERRAIN_WALL_HARDROCK:
            ds_map_replace(thisWall, "solidity", 1);
            ds_map_add(loot, "roughJunk", floor(rrandom(1)+2));
            ds_map_add(loot, "roughMetal", floor((rrandom(4)-1)*(lootMultiplier)));
            ds_map_add(loot, "roughFuel", floor(max(0,rrandom(4))*(lootMultiplier)));
            break;
    }
    
    if (argument_count > 2 && argument[2] && ds_exists(argument[1], ds_type_map)){
        var ressources = getRessources();
        var givenLoot = argument[1];
        for (var i = 0; i < array_length_1d(ressources); i++){
            var rsc = ressources[i];
            if (is_undefined(givenLoot[? rsc]) || givenLoot[? rsc] <= 0){
                continue;
            }
            if (is_undefined(loot[? rsc]) || loot[? rsc] <= 0){
                loot[? rsc] = 0;
            }
            loot[? rsc] += givenLoot[? rsc];
        }
    }
}
if (object_debug.debug){
    var finalLoot = "";
    var ressources = getRessources();
    for(var i = 0; i < array_length_1d(ressources); i++){
        var rsc = ressources[i];
        if (is_undefined(loot[? rsc])){
            continue;
        }
        finalLoot += "x"+string(loot[? rsc])+" "+rsc+",";
    }
}
if (argument[0] == TERRAIN_WALL_UNBREAKABLE){
    ds_map_logdestroy(loot);
    loot = noone;
}
ds_map_add_map(thisWall, "loot", loot);

return thisWall;
