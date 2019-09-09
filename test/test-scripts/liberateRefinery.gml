///liberateRefinery(instance_refinery)
if (instance_exists(object_refining)){
    var list = getRefineryQueue(argument0);
    var map = ds_map_logcreate();
    
    for (var i = 0; i < ds_list_size(list); i++){
        var rsc = list[| i];
        if (is_undefined(map[? rsc])){
            map[? rsc] = 0;
        }
        map[? rsc] ++;
    }
    dropRsc(map, argument0);
    ds_list_destroy(list);
    ds_map_logdestroy(map);
}
