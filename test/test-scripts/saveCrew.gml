///saveCrew()
// Saves crew to disk
var tempMap = ds_map_logcreate();
ds_map_add_list(tempMap, "default", (object_station.crew)); /// Adding ds_list to the default key

var crewString = json_encode(tempMap);

writeFile(crewString, "crew");
tempMap[? "default"] = noone;
ds_map_logdestroy(tempMap);

loadCrew();
