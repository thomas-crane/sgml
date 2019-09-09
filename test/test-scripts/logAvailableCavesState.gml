///logAvailableCavesState(str_from)
// Very specific function created to hunt a memory leak
// Can be safely destroyed if the leak has been solved

if (!ds_exists(object_station.company, ds_type_map)){
    return false;
}

var mem = "<undefined>";
if (!is_undefined(object_station.company[? "memories"])){
    mem = json_encode(object_station.company[? "memories"]);
}

if (
    !is_undefined(object_selectcave.availableCavesList[|1]) &&
    !is_undefined(object_selectcave.availableCavesList[|0])
){ 
    log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"+       string_upper(argument0)+"
        Cavelist state is 
        ["+string(object_selectcave.availableCavesList[|0])+"] "+json_encode(object_selectcave.availableCavesList[|0])+"
        ["+string(object_selectcave.availableCavesList[|1])+"] "+json_encode(object_selectcave.availableCavesList[|1])+"
        Memories state is "+mem+
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    );
}
             
