///getHardWeight()
var rscs = getFancyMaterials();
var totalWeight = 0;
for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    var w = getWeight(rsc);
    totalWeight += getHardStock(rsc)*w;
}
var buildings = getBuildings();
for (var i = 0; i < array_length_1d(buildings); i++){
    var build = buildings[i];
    var w = getWeight(build);
    totalWeight += getHardStock(build)*w;
}

return totalWeight;
