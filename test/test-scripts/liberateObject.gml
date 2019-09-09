///liberateObject(object, instance_building_toolstore, *amount=1)
//Liberates on the ground these objects from this toolstore

var object = argument[0];
var building = argument[1];
var amount = 1;
if (argument_count > 2){
    amount = argument[2];
}

var spawnChunkPos = array(noone, noone);
if (instance_exists(building)){
    var sPPArr = getSurroundingsIndex(building.ownIsoIndex, getBuilding(building.object_index, "size"));
    for (var i = 0; i < array_length_1d(sPPArr); i++){
        var sPP = sPPArr[i];
        if (!onChunk(sPP, object_solid)){
            spawnChunkPos = sPP;
            break;
        }
    }
}
if (spawnChunkPos[0] < 0){
    return false; //means no possible position has been found
}
for (var i = 0; i < amount; i++){
    instance_create(spawnChunkPos[0]*G_CELLSIZE + random(G_CELLSIZE), spawnChunkPos[1]*G_CELLSIZE + random(G_CELLSIZE), object);
}
return true;
