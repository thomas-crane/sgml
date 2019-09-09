///getFancyMaterials()

var rscs = getRessources();
var fancyRsc = array(noone);

for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    if (!isBuildingMaterial(rsc) && !isRoughMaterial(rsc)){
        if (fancyRsc[0] == noone){
            fancyRsc[0] = rsc;
        }
        else{
            fancyRsc[array_length_1d(fancyRsc)] = rsc;
        }
    }
}

return fancyRsc;
