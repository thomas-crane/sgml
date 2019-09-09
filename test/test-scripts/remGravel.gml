///remGravel(arr_iso_index)
var ii = argument[0];
//log("Destroying gravel at position "+string(ii)+", map "+string(getGravelMap(ii))+", containing "+json_encode(getGravelMap(ii))+" and putting it to noone");
groundmode_delete(ii);
ds_map_logdestroy(getGravelMap(ii));
ds_grid_set(object_gravelman.gravelGrid, ii[0], ii[1], noone);
ds_grid_set(global.terrain_gravel, ii[0], ii[1], noone);
