///isSingleSelected()
var size = 0;
if (instance_exists(object_masterselector)){
    size = ds_list_size(object_masterselector.selectedEmmets);
}

if (size == 1 && object_masterselector.selectionType == EMMET){
    return true;
}
else{
    return false;
}
