///isOccupied(array_iso_index)

if (getWall(argument[0]) > 0 || 
    getGravel(argument[0]) > 0 || 
    onChunk(argument[0], object_building_parent) || 
    onChunk(argument[0], object_building_yard) || 
    onChunk(argument[0], object_ground) ||
    onChunk(argument[0], object_solid)
    ){
    return true;
}
return false;
