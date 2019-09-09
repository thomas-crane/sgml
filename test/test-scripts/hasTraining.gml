///hasTraining(TRAINING_, *id)
var thisEmmet = id;
if (argument_count > 1){
    thisEmmet = argument[1];
}
var trainingList = thisEmmet.trainings;

for (var i = 0; i < ds_list_size(trainingList); i++){
    if (ds_list_find_value(trainingList,i) == argument[0]){
        return true;
    }
}
return false;
