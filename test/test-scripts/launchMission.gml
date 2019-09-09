///launchMission(cave, totalCost)

var buildings = getRequiredBuildings();
for (var i = 0; i < array_length_1d(buildings); i++){
    var thisBuild = buildings[i];
    if (getHardStock(thisBuild) <= 0){
        addHardStock(thisBuild);
    }
}
addToStat("cavesExplored", 1);
playSfx(sound_sfx_launchmission);
remFunds(argument1);
gotoCave(argument0);
