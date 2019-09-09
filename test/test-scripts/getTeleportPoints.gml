///getTeleportPoints()
//returns object_buliding_ that has ability to teleport
var tpPoints = array(noone);
var tpBuildings = teleporters();

for (var i = 0; i < array_length_1d(tpBuildings); i++){
    if (hasBuilding(tpBuildings[i])){
        for (var j = 0; j < instance_number(tpBuildings[i]); j++){
            var thisTeleporter = instance_find(tpBuildings[i], j);
            if (isOperational(thisTeleporter)){
                if (tpPoints[0] == noone){
                    tpPoints[0] = thisTeleporter;
                }
                else{
                    tpPoints[array_length_1d(tpPoints)] = thisTeleporter;
                }
            }
        }
    }
}
return tpPoints;
