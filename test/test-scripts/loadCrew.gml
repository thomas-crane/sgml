///loadCrew()

var sum = getSum("crew");
if (is_undefined(sum)){
    log("Sum is missing from sumlist, could not load crew", "LOADCREW");
    return false;
}
var filePath = object_disk.crewPath+"/"+sum;
var tempMap = readFile(filePath);

var crew = ds_list_create();
/// Manual copy because ds_list_copy isn't good at copying maps
log("Checking crew from temporary map ["+string(tempMap)+"]...");

var diskCrew = ds_map_find_value(tempMap, "default");
for (var i = 0; i < ds_list_size(diskCrew); i++){
    var crewMember = diskCrew[| i];
    
    if (crewMember[? "eid"] != undefined){
    
        log("Crew member #"+string(i)+" ["+string(crewMember)+":"+string(ds_exists(crewMember, ds_type_map))+"] : "+crewMember[? "name"]+"."+string(crewMember[? "eid"])+" : "+json_encode(crewMember[? "biography"]));
        if (ds_map_size(crewMember[? "biography"]) <= 0){
            // gen bio
            var bio = crewMember[? "biography"];
            if (is_undefined(bio[? "birthplace"])) bio[? "birthplace"] = BIRTHPLACE_EARTH
            if (is_undefined(bio[? "age"])) bio[? "age"] = 20;
            if (is_undefined(bio[? "trait"])) bio[? "trait"] = TRAIT_NONE
            log(">> Generated biography : "+json_encode(crewMember[? "biography"]));
        }
        
        ds_list_add(crew, crewMember);
        ds_list_mark_as_map(crew, ds_list_size(crew)-1);
        
        diskCrew[| i] = noone;
    }
    else{
        log("Marked invalid crew member ["+string(crewMember)+"] "+json_encode(crewMember)+" for deletion");
    }
}
ds_map_logdestroy(tempMap);

ds_list_destroy(object_station.crew);
object_station.crew = crew;
return true;
