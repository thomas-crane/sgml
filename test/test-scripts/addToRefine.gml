///addToRefine(instance_refinery, str_ressource)
if (instance_exists(object_refining)){
    var ref = argument0;
    var rsc = argument1;
    var map = object_refining.refineriesObjective;
    if (is_undefined(map[? ref])){
        map[? ref] = ds_list_create();
    }
    var list = map[? ref];
    ds_list_add(list, rsc);
}
