///genEmmet(*offlineMarket=false, *onlineCrewMember=noone)

var market = false;
var onlineCrewMember = noone;
if (argument_count > 0){
    market = argument[0];
}
if (argument_count > 1){
    onlineCrewMember = argument[1];
}

var defaultEquipments = ds_list_create();
ds_list_add(defaultEquipments, EQUIPMENT_DRILL, EQUIPMENT_SHOVEL);

var emmet = ds_map_logcreate();    

var defaultTrainings = ds_list_create();
if (market){
    ds_list_add(defaultTrainings, choose(TRAINING_DYNAMITE, TRAINING_GEOLOG));
    ds_map_add(emmet, "origin", ORIGIN_MARKET);
}
else{
    ds_map_add(emmet, "origin", ORIGIN_CREATOR);
}
    

ds_map_add(emmet, "hp", 100);
ds_map_add_list(emmet, "equipments", defaultEquipments);


if (onlineCrewMember == noone || !ds_exists(onlineCrewMember, ds_type_map)){
    ds_map_add(emmet, "name", genEmmetName());
    if (market){
        ds_map_add(emmet, "previousOwner", "EmmetsUnited");
    }
    else{
        ds_map_add(emmet, "previousOwner", object_station.company[?'cid']);
    }
    ds_map_add(emmet, "creationTime", unix_timestamp());
    ds_map_add(emmet, "eid", irandom(99999999));
    ds_map_add_list(emmet, "trainings", defaultTrainings);
    ds_map_add_map(emmet, "biography", genEmmetBiography()); /// Birthplace, Age, Trait,  
}
else{
    ds_list_destroy(defaultTrainings);

    ds_map_add(emmet, "name", onlineCrewMember[? "name"]);
    ds_map_add(emmet, "previousOwner", onlineCrewMember[? "previousOwner"]);
    ds_map_add(emmet, "creationTime",onlineCrewMember[? "creationTime"]);
    ds_map_add(emmet, "eid", onlineCrewMember[? "eid"]);
    
    var trainings = json_decode(base64_decode(onlineCrewMember[? "trainings"]));
    trainingList = trainings[? "default"];
    ds_map_add_list(emmet, "trainings", trainingList);
    trainings[?"default"] = noone;
    ds_map_logdestroy(trainings);
    
    
    var biography = json_decode(base64_decode(onlineCrewMember[? "biography"]));
    ds_map_add_map(emmet, "biography", biography); 
      
    emmet [? "ORIGIN"] = ORIGIN_ONLINE;
}

/// Used ingame
ds_map_add(emmet, "deployed", false);
ds_map_add(emmet, "instance", noone);

return emmet;
