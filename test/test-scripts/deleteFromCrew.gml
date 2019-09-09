///deleteFromCrew(eid)
for (var i = 0; i < ds_list_size(object_station.crew); i++){
    var crewMember = object_station.crew[| i];
    var eid = crewMember[? "eid"];
    if (eid == argument[0]){
        ds_list_delete(object_station.crew, i);
        break;
    }
}
