///isSelectedEmmet(id)
var value = 0;
if (instance_exists(object_masterselector)){
    value = ds_list_find_index(object_masterselector.selectedEmmets, argument[0]);
}

if (value > -1 && object_masterselector.selectionType == EMMET){
    return true;
}
else{
    return false;
}
