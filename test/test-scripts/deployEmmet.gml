///deployEmmet(positionArr, eid*=noone)
// Spawns crew member and adds it to deployedEmmets list
var eid = noone;
var position = argument[0];

if (argument_count > 1){
    eid = argument[1];
}

var pick = 0;

if (eid != noone){
    for (var i = 0; i < ds_list_size(object_station.crew); i++){
        var thisEmmet = ds_list_find_value(object_station.crew, i);
        if (thisEmmet[? "eid"] == eid){
            pick = i;
            break;
        }
    }
}
else{
    for (var i = 0; i < ds_list_size(object_station.crew); i++){
        var thisEmmet = ds_list_find_value(object_station.crew, i);
        if (!thisEmmet[? "deployed"]){
            pick = i;
            break;
        }
    }
}

var crewMember = ds_list_find_value(object_station.crew, pick);
if (crewMember[? "deployed"]){
    return false;
}

ds_list_add(object_teleportman.deployedEmmets, crewMember); 

tpFX(array(position[0], position[1]));

var emmet = instance_create(position[0], position[1], object_emmet);
playSfx(sound_sfx_teleport_in, false, emmet);

crewMember[? "deployed"] = true;
crewMember[? "instance"] = emmet;

emmet.arriving = true;
emmet.timerOfArrival = 1;

emmet.name = crewMember[? "name"];
emmet.actHp = crewMember[? "hp"];
ds_list_destroy(emmet.trainings );
ds_list_destroy(emmet.equipments);
emmet.trainings = crewMember[? "trainings"];
emmet.equipments = crewMember[? "equipments"];
emmet.eid = crewMember[? "eid"];
emmet.color = getEmmetColor(crewMember);


return (emmet); 

