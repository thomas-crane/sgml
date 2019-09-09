///getRessourceFromObject(object_pickable_)
var rscs = getRessources();

for (var i = 0;i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    if (getRessource(rsc, "object") == argument[0]){
        return rsc;
        break;
    }
}
