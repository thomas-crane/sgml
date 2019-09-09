///isSelectedBuilding(object_building_)
if (instance_exists(object_masterselector)
    && object_masterselector.selectionType == BUILDING
    && object_masterselector.selectedBuilding == argument[0]){
    return true;
}
return false;
