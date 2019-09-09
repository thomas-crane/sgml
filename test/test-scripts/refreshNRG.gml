///refreshNRG()

var buildings = getBuildings();
for (var i = 0; i < array_length_1d(buildings); i++){
    /*
    if (!isPowerSource(buildings[i])){
        continue;
    }
    */
    for (var j = 0; j < instance_number(buildings[i]); j++){
        var thisBuild = instance_find(buildings[i], j);
        exploreNRG(thisBuild.ownIsoIndex, thisBuild.id);
    }
}
