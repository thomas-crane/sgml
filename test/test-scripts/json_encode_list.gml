///json_encode_list(ds_list)
var map = ds_map_create();
ds_map_add_list(map, "[ds_list]", argument0);
var str = json_encode(map);
map[? "[ds_list]"] = noone;
ds_map_destroy(map);
return str;
