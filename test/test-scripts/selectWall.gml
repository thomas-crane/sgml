///selectWall(array_iso_index)
var thisIndex = argument[0];
if (instance_exists(object_masterselector)){
    object_masterselector.selection = thisIndex;
    object_masterselector.selectionType = WALL;
}
