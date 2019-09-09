///addToKIA(crew_member_map)
var memories = object_station.company[? "memories"];
if (!ds_map_exists(memories, "KIA")){
    ds_map_add_list(memories, "KIA", ds_list_create());
}
var kia = memories[? "KIA"];
kia[| ds_list_size(kia)] = argument0;
ds_list_mark_as_map(kia, ds_list_size(kia)-1);
