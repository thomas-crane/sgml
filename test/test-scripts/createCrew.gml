///createCrew(*crewSize)
// Generates a new emmet crew and returns it

var crewSize = STARTING_CREW_SIZE;
if (argument_count > 0){
    crewSize = argument[0];
}
var crew = ds_list_create();


for (var i = 0; i < crewSize; i++){
    
    var emmet = genEmmet();
    
    ds_list_add(crew, emmet);   
    ds_list_mark_as_map(crew, ds_list_size(crew)-1);
    
    log("Created emmet "+emmet[? "name"]+"."+string(emmet[? "eid"])+" and added it to crew", "CreateCrew");
}

return crew;


