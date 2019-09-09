///onlineSendCrew(json_crew)
// Sends an emmet to the online market

var emmetJson = argument0;
var map = json_decode(emmetJson);
var list = map[? "default"];
for (var i = 0; i < ds_list_size(list); i++){
    var cm = list[|i];
    onlineSendEmmet(json_encode(cm));
}
ds_map_logdestroy(map);
