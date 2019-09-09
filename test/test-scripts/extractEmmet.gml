///extractEmmet(eid)
for (var i = 0; i < ds_list_size(object_teleportman.deployedEmmets); i++){
    var crewMember = object_teleportman.deployedEmmets[| i];
    var eid = crewMember[? "eid"];
    if (eid == argument[0]){
        crewMember[? "hp"] = crewMember[? "instance"].actHp;
        crewMember[? "instance"] = noone;
        crewMember[? "deployed"] = false;
        ds_list_delete(object_teleportman.deployedEmmets, i);
        break;
    }
}
