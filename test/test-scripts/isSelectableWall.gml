///isSelectableWall(array_iso_index)
var pos = argument[0];
if (!isInGrid(pos)){
    return false;
}
var wm = getWallMap(argument[0]);

if (wm){
    if (isNotSurrounded(argument[0], true, true) &&
        isVisible(argument[0]) &&
        ds_map_find_value(wm, "solidity") >= 0
    ){
        return true;
    }
}
return false;
