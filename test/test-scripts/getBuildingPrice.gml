///getBuildingPrice(object_building_)

var building = argument[0];
var needs = getBuilding(building, "needs");
var rArr = getRessources();

var cost = 0;
var priceMultiplier = 5;

for (var i = 0; i < array_length_1d(rArr); i++){
    cost += needs[? rArr[i]] * getRessource(rArr[i], "price") * priceMultiplier;
}

ds_map_logdestroy(needs);

return cost;
