///isTrainedToPick(object_instance_pickable_)
switch (argument[0].object_index){
    default:
        return true;
        break;
        
    case object_pickable_dynamite:
        return hasTraining(TRAINING_DYNAMITE, id);
        break;
}
