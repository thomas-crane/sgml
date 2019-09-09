///callEmmet(TPPoint)
var building = argument[0];

if (getTPCooldown(building) > 0){
    return false;
}
var availableSP = array(noone);

for (var i = 0; i < array_length_1d(building.surroundingPathways); i++){
    if (instance_exists(building.surroundingPathways[i])){
        var sPP = building.surroundingPathwaysPos[i];
        if (availableSP[0] == -1){
            availableSP[0] = array(sPP[0]*G_CELLSIZE, sPP[1]*G_CELLSIZE);
        }
        else{
            availableSP[array_length_1d(availableSP)] = array(sPP[0]*G_CELLSIZE, sPP[1]*G_CELLSIZE);
        }
    }
}

/// Teleporting on an available pathway if possible
if (array_length_1d(availableSP) > 0 && availableSP[0] != noone){

    var index = floor(random(array_length_1d(availableSP)));
    var sp = availableSP[index];
    
    var position = sp;
    var deployed = deployEmmet(position);
    
    if (instance_exists(deployed)){
        setTPCooldown(building, TELEPORT_COOLDOWN);
    }
    
    return true;
}

/// If thats not possible, teleport on a non-wall adjacent cell
else{
    var surr = getSurroundingsIndex(building.ownIsoIndex, 1);
    for (var i = 0; i < array_length_1d(surr); i++){
        if (!wallExists(surr[i]) && !onChunk(surr[i], object_solid)){            
            var sp = surr[i];
            var position = array(sp[0]*G_CELLSIZE + G_CELLSIZE/2, sp[1]*G_CELLSIZE + G_CELLSIZE/2);
            var deployed = deployEmmet(position);
            if (instance_exists(deployed)){
                setTPCooldown(building, TELEPORT_COOLDOWN);
            }
            
            return true;
        }
    }
}

return false;
