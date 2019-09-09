///getRefineryQueue(instance_refinery)
if (instance_exists(object_refining)){
    var ref = argument0;
    var map = object_refining.refineriesObjective;
    if (is_undefined(map[? ref])|| !ds_exists(map[? ref], ds_type_list)){
        map[? ref] = ds_list_create();
    }
    var list = map[? ref];
    return list;
}
