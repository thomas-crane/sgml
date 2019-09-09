///isABuildingPathway(instance_pathway_)
var surroundings = getSurroundingsIndex(getIsoIndex(array(argument0.x, argument0.y)), 1);
for (var i = 0; i < array_length_1d(surroundings); i++){
    var sur = surroundings[i];
    if (onChunk(sur, object_building_parent) > 0){
        return true;
    }
}
return false;
