///hasSelection(*EMMET-WALL-GRIDCELL)
if (instance_exists(object_masterselector)){
    if (argument_count > 0){

        if (object_masterselector.selectionType == argument[0]){
            return true;
        }
        else{
            return false;
        }
    }
    else{
        if (object_masterselector.selectionType != noone){
            return true;
        }
        else{
            return false;
        }
    }
}
