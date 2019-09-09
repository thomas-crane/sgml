///isCellSelected(array_index_xy)
if (instance_exists(object_masterselector)){
    
    if (object_masterselector.selectionType == GRIDCELL && 
        object_masterselector.selection[0] == argument0[0] &&
        object_masterselector.selection[1] == argument0[1]
            ){
        return true;
    }
}
return false;
