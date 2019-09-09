///emmetSelectionSize()
var size = 0;
if (instance_exists(object_masterselector)){
    size = ds_list_size(object_masterselector.selectedEmmets);
    if (object_masterselector.selectionType != EMMET){
        size = 0;
    }
}

return size;

