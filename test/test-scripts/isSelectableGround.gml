///isSelectableGround(array_iso_index)
var pos = argument[0];
if (!isInGrid(pos)){
    
    return false;
}

if (!isTypeSolid(getType(argument[0])) &&
    isVisible(argument[0]) &&
    !wallExists(argument[0])) &&
    !onChunk(argument[0], object_building_parent){
    return true;
}

return false;
