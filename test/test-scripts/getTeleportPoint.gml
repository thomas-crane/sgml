///getTeleportPoint()
//returns nearest object_buliding_ that has ability to teleport
//and that has the less cooldown

var tpPoints = getTeleportPoints();
var tpMap = ds_map_logcreate();
var cds = ds_list_create();

for (var i = 0; i < array_length_1d(tpPoints); i++){
    var cd = getTPCooldown(tpPoints[i]);
    ds_list_add(cds, cd);
    ds_map_add(tpMap, cd, tpPoints[i]);
}
ds_list_sort(cds, true);
var buildList = ds_list_create();

var lastCd = -1;
for (var i = 0; i < ds_list_size(cds); i++){
    var thisCd = ds_list_find_value(cds, i);
    if (thisCd < lastCd){
        lastCd = thisCd;
        ds_list_delete(tpMap, i-1);
        ds_list_add(buildList, ds_map_find_value(tpMap, thisCd));
    }
    else if (lastCd == -1 || thisCd == lastCd){
        lastCd = thisCd;
        ds_list_add(buildList, ds_map_find_value(tpMap, thisCd));
    }
}
ds_map_logdestroy(tpMap);
ds_list_destroy(cds);

if (ds_list_size(buildList) > 1){
    
    var buildMap = ds_map_logcreate();
    var distances = ds_list_create();

    for (var i = 0; i < ds_list_size(buildList); i++){
        var thisBuild = ds_list_find_value(buildList, i);
        var dist = point_distance(thisBuild.x, thisBuild.y, view_xview[view_current]+view_wview[view_current]/2, view_yview[view_current]+view_hview[view_current]/2);
        
        
        ds_list_add(distances, dist);
        ds_map_add(buildMap, dist, thisBuild);
    }
    
    ds_list_sort(distances, true);
    
    var toReturn = ds_map_find_value(buildMap, ds_list_find_value(distances, 0));
    ds_map_logdestroy(buildMap);
    ds_list_destroy(distances);
    return toReturn;
}
else{
    var toReturn = ds_list_find_value(buildList, 0);
    ds_list_destroy(buildList);
    return toReturn;
}
