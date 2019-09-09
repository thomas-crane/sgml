///canDrill(*id, *array_xy_wall_todrill)
var drillerId = id;
var drillSolidity = 0;
if (argument_count > 0){
    drillerId = argument[0]
}
if (argument_count > 1){
    drillSolidity = getWallMap(argument[1]);
    drillSolidity = ds_map_find_value(drillSolidity, "solidity");
}

var drillCap = -1;

drillCap = getDrillCapacity(drillerId);

if (drillCap >= drillSolidity && drillSolidity >= 0){
        return true;
} 
else{
    return false;
}

