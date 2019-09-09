///powerNeeded(object_building_)
var instance = argument[0];
if (isPowerSource(instance.object_index)){
    return 0;
}
if (instance_exists(instance)){
    switch (instance.object_index){
        default:
            return 1;
            break;
        
        case object_building_uplinker:
            return 1;
            break;
        
        case object_building_refinery:
            return 1;
            break;
        
        case object_building_stocker:
            return 1;
            break;
    }
}
