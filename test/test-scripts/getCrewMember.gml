///getCrewMember(eid, need)
for (var i = 0; i < ds_list_size(object_station.crew); i++){
    var crewMember = object_station.crew[|i];
    if (crewMember[? "eid"] != argument0){
        continue;
    }
    return crewMember[? argument1];
    break;
}
