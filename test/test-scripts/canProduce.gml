///canProduce(object_building_)
// Has the player enough ressources to produce ?

var build = argument0;
if (!isBuildable(build)){
    return false;
}
var needs = getBuilding(build, "needs");

var rscs = getRessources();
var buildRsc = array(noone);

for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    if (isBuildingMaterial(rsc)){
        if (buildRsc[0] == noone){
            buildRsc[0] = rsc;
        }
        else{
            buildRsc[array_length_1d(buildRsc)] = rsc;
        }
    }
}

var rscOk = true;
for (var i = 0; i < array_length_1d(buildRsc); i++){
    var amountNeeded = ds_map_find_value(needs, buildRsc[i]);
    if (is_undefined(amountNeeded)){
        continue;
    }
    if (getStock(buildRsc[i]) < amountNeeded){
        rscOk = false;
    }
}

ds_map_logdestroy(needs);

return rscOk;
