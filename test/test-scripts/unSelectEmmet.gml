///unSelectEmmet(id)
if (instance_exists(object_masterselector)){
    var index = ds_list_find_index(object_masterselector.selectedEmmets, argument[0]);
    if (!is_undefined(index)){
        ds_list_delete(object_masterselector.selectedEmmets, index);
    }
}
