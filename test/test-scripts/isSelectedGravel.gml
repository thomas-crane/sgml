///isSelectedGravel(array_iso_index)
var value = 0;
var thisIndex = argument[0];
if (instance_exists(object_masterselector) && object_masterselector.selectionType == GRAVEL){
    value = object_masterselector.selection;

    if (value[0] == thisIndex[0] && value[1] == thisIndex[1]){
        return true;
    }
    else{
        return false;
    }
}
