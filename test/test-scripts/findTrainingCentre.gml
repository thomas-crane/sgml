///findTrainingCentre(TRAINING_, *id)
var subject = id;
if (argument_count > 1){
    subject = argument[1];
}
var training = argument[0];

if (!instance_exists(subject)){
    return noone;
}

var trainingCentreArr = getTrainingCentre(training);
var contestants = ds_list_create();

for (var i = 0; i < array_length_1d(trainingCentreArr); i++){
    var thisKind = trainingCentreArr[i];
    
    for (var j = 0; j < instance_number(thisKind); j++){
    
        var thisInstance = instance_find(thisKind, j);
        var surroundings = getSurroundingsIndex(getIsoIndex(array(thisInstance.x, thisInstance.y)), 1);
        var objective = array(noone, noone);
        
        for (var k = 0; k < array_length_1d(surroundings); k++){
            var pos = surroundings[k];
            pos = array(pos[0]*G_CELLSIZE, pos[1]*G_CELLSIZE);
            if (canGo(pos , array(subject.x, subject.y))){
                objective = pos;
                break;
            }
        }
        if (isOperational(thisInstance) &&
            objective[0] != noone){
            ds_list_add(contestants, thisInstance);
        }
    }
}
if (ds_list_size(contestants) == 1){
    return ds_list_find_value(contestants, 0);
}
else if (ds_list_size(contestants) > 1){
    
    var buildMap = ds_map_logcreate();
    var distances = ds_list_create();

    for (var i = 0; i < ds_list_size(contestants); i++){
        var thisBuild = ds_list_find_value(contestants, i);
        var dist = point_distance(thisBuild.x, thisBuild.y, subject.x, subject.y);
                
        ds_list_add(distances, dist);
        ds_map_add(buildMap, dist, thisBuild);
    }
    
    ds_list_sort(distances, true);
    
    var toReturn = ds_map_find_value(buildMap, ds_list_find_value(distances, 0));
    ds_map_logdestroy(buildMap);
    ds_list_destroy(distances);
    
    return toReturn;
}
//needs to pick the nearest...
return noone;
