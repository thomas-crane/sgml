///clearSelection(*stopRectangle=true)

var stopRectangle = true;
if (argument_count> 0){
    stopRectangle = argument[0];
}
if (instance_exists(object_masterselector)){
    ds_list_clear(object_masterselector.selectedEmmets);
    if (object_masterselector.selectionType == WALL){
        revertWallColor(object_masterselector.selection);
    }
    else if (object_masterselector.selectionType == GRIDCELL){
        if (getGravel(object_masterselector.selection) != noone && !isMarkedToClear(object_masterselector.selection)){
            groundmod_set_colour(object_masterselector.selection, c_white);
        }
        else{
            groundmod_set_colour(object_masterselector.selection, c_gray);
        } 
    }
    object_masterselector.selectionTime = 0;
    if (stopRectangle){
        object_masterselector.isSelectingRectangle = false;
        object_masterselector.startX = global.i[I_X];
        object_masterselector.startY = global.i[I_Y];
    }
    object_masterselector.selectionType = noone;
    object_masterselector.selectedBuilding = noone;
}
