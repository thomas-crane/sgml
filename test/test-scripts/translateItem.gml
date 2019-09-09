///translateItem(ITEM_ , *string_moreInfo)
var moreInfo = 0;
if (argument_count > 1){
    moreInfo = argument[1];
}
switch (argument[0]){
    default:
        return "???";
        break;
    
    case ITEM_BACK:
        return "Back";
        break;
    
    case ITEM_CALL_EMMET:
        return "Teleport Emmet to base";
        break;
    
    case ITEM_BUILDING_LIST:
        return "Build";
        break;
    
    case ITEM_DROP_OBJECT:
        return "Drop held object";
        break;
    
    case ITEM_KILL_EMMET:
        return "Teleport back Emmet to surface";
        break;
    
    case ITEM_BUILD_PATHWAY:
        return "Build a pathway";
        break;
    
    case ITEM_CLEAR_GRAVEL:
        return "Mark to clear";
        break;
    
    case ITEM_DRILL_WALL:
        return "Mark to drill";
        break;
    
    case ITEM_POWER:
        return "Power on/off";
        break;
    
    case ITEM_UPGRADE:
        if (real(moreInfo) > 2){
            return "No upgrades available";
        }
        else{
            return "Upgrade to level "+string(moreInfo);
        }
        break;
    
    case ITEM_KILL_BUILDING:
        return "Teleport back building to surface";
        break;
    
    case ITEM_EXIT_LEVEL:
        return "Jump to the next level";
        break;
        
    case ITEM_DYNAMITE_WALL:
        return "Mark to dynamite";
        break;
        
    case ITEM_TRAINING_MENU:
        return "Train emmet...";
        break;
        
    case ITEM_TRAIN_DYNAMITE:
        return "Train an explosive expert";
        break;
    
    case ITEM_BUILD_STATION:
    case ITEM_BUILD_POWERPLANT:
    case ITEM_BUILD_TELERAMP:
    case ITEM_BUILD_TOOLSTORE:
    case ITEM_BUILD_SISMIC:
        return translateBuilding(getBuildingFromMenuItem(argument[0]));
        break;
}
