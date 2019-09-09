///isBuildable(object_building)
// Is this building something buildable ingame, or not ?
switch (argument0){
    default :
        return true;
        break;
        
    case object_building_predeployed_battery:
        return false;
        break;

}
