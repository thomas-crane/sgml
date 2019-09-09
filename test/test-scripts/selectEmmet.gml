///selectEmmet(id)
if (instance_exists(object_masterselector)){
    ds_list_add(object_masterselector.selectedEmmets, argument[0]);
    object_masterselector.selectionType = EMMET;
}
