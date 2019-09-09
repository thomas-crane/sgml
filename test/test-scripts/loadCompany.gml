///loadCompany()

var sum = getSum("company");
if (is_undefined(sum)){
    log("Sum is missing from sumlist, could not load station", "LOADCOMPANY");
    return false;
}

var company = readFile(object_disk.companyPath+"/"+sum);

var version = string(object_game.releaseType)+string(object_game.versionNumber);

if (company < 0){
    log("WARNING : Invalid company, destroying savegame");
    destroySavegame();
    return false;
}

if (company[? "version"] != version){
    var companyVersion = company[?"version"];
    if (is_undefined(companyVersion)){
        companyVersion = "UNDEFINED";
    }
    log("WARNING : Company version mismatch ! Expected ["+version+"], got "+companyVersion, "LoadCompany");
}
             
if (!is_undefined(object_station.company[? "memories"])){
    log("Destroyed memories ["+string(object_station.company[? "memories"])+"] "+json_encode(object_station.company[?"memories"]));
    ds_map_logdestroy(object_station.company[? "memories"]);
    object_station.company[? "memories"] = noone;
}
ds_map_logdestroy(object_station.company); 
object_station.company = company;


if (ds_map_size(company) <= 0){
    log("WARNING : Throwing away company "+string(company[? "name"])+" because of ZERO size");
    ds_map_logdestroy(object_station.company);
    object_station.companyLoaded = false;
    return false;
}
var mem = object_station.company[? "memories"];

if (is_undefined(mem)){
    log("WARNING : Throwing away company "+string(company[? "name"])+" because of undefined memories");
    ds_map_logdestroy(object_station.company);
    object_station.companyLoaded = false;
    return false;
}

/// SECURITY CHECK
var history = mem[? "history"];
for (var i = 0; i < ds_list_size(history); i++){
    var cave = history[| i];
    // Backward compatibility
    if (!is_undefined(cave) && is_undefined(cave[? CAVE_PLANET])){
        cave[? CAVE_PLANET] = 0;
    }    
    // Endof
    if (!isValidCave(cave)){
        log("WARNING : "+json_encode(cave)+" from memory "+json_encode(mem)+" is not a valid cave, has been replaced by a newly generated cave during the loading", "LOADCOMPANY");
        history[|i] = createRandomCave(i+1);
        ds_list_mark_as_map(history, i);
    }
    log("Loaded cave ["+string(history[|i])+"] "+json_encode(history[|i]));
}
object_station.company[? "version"] = version;

if (!object_game.offlineMode){
    onlineSendCompany(object_station.company);
}

setCompanyRanking(object_station.company[? "cid"]);

return true;
