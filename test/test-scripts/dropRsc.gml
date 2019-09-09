///dropRsc(rscMap, instance_building)
var building = argument1;
var rscMap = argument0;
var spawnChunkPos = array(noone, noone);
var inst = noone;
if (instance_exists(building)){
    var sPPArr = building.surroundingPathwaysPos;
    for (var i = 0; i < array_length_1d(sPPArr); i++){
        var sPP = sPPArr[i];
        if (canBuildOn(object_building_parent, sPP) || !onChunk(sPP, object_solid)){
            spawnChunkPos = sPP;
            break;
        }
    }
}
if (spawnChunkPos[0] == noone){
    return false;
}
var rscs = getRessources();


for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    
    if (is_undefined(rscMap[? rsc])){
        continue;
    }
    var count = rscMap[? rsc];
    
    for (var j = 0; j < count; j++){
        var realPos = array(spawnChunkPos[0]*G_CELLSIZE+random(G_CELLSIZE), spawnChunkPos[1]*G_CELLSIZE+random(G_CELLSIZE));
        instance_create(realPos[0], realPos[1], getRessource(rsc, "object"));
    }
}
return true;
