///formattedNeeds(object_building_)
var building = argument0;
var needs = getBuilding(building, "needs");
var finalString = "";
if (!isBuildable(building)){
    ds_map_logdestroy(needs);
    return "";
}
var rscs = getRessources();
for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    if (needs[? rsc] > 0){
        finalString += "#x"+string(needs[? rsc])+" "+translate("RSC", rsc)+"";
    }
}
ds_map_logdestroy(needs);
return finalString;
