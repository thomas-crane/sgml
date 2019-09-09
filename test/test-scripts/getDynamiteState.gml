///getDynamiteState()
var dynamiteCap = false;
for (var i = 0; i < instance_number(object_emmet); i++){
    var thisEmmet = instance_find(object_emmet, i);
    if (hasTraining(TRAINING_DYNAMITE, thisEmmet)){
        dynamiteCap = true;
        break;
    }
}

return (dynamiteCap && hasBuilding(object_building_stocker));
