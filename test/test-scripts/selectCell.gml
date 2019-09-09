///selectCell(array_index_xy)
if (instance_exists(object_masterselector)){
    object_masterselector.selectionType = GRIDCELL;
    object_masterselector.selection = argument[0];
}
