///destroyPathway(id)
var col = argument0;
if (instance_exists(col)){
    var ii = getIsoIndex(array(col.x, col.y));
    var loot = ds_map_logcreate();
    if (!isABuildingPathway(col)){
        ds_map_logdestroy(loot);
        loot = getBuilding(object_ground_pathway, "needs");
        loot = makeRough(loot);
    };
    addGravel(ii, loot);
    with (col){
        instance_destroy();
    }
    var sr = getSurroundingsIndex(ii, 1);
    for (var i = 0; i < array_length_1d(sr); i++){
        var pos = sr[i];
        if (onChunk(pos, object_ground_pathway)){
            exploreNRG(pos);
        }
    }
}
