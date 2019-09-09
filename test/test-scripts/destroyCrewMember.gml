///destroyCrewMember(eid)
for (var i = 0; i < ds_list_size(object_teleportman.deployedEmmets); i++){
    var crewMember = object_teleportman.deployedEmmets[| i];
    var eid = crewMember[? "eid"];
    if (eid == argument[0]){
        addToKIA(crewMember);
        deleteFromCrew(eid);
        addToStat("emmetsLost", 1);
    }
}
