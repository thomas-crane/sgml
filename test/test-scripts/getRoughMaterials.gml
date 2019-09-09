///getRoughMaterials()

var rscs = getRessources();
var buildRsc = array(noone);

for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    if (isRoughMaterial(rsc)){
        if (buildRsc[0] == noone){
            buildRsc[0] = rsc;
        }
        else{
            buildRsc[array_length_1d(buildRsc)] = rsc;
        }
    }
}

return buildRsc;
