///getDisabledTip(ITEM_)
switch (argument0){
    default:
        return translate("ITEM_TIP", argument0);
        break;
        
    case ITEM_KILL_BUILDING:
        return translate("ITEM_TIP", "power");
        break;
        
    case ITEM_DYNAMITE_WALL:
        return translate("ITEM_TIP", "dynamite");
        break;
        
    case ITEM_CLEAR_GRAVEL:
    case ITEM_DRILL_WALL:
        return translate("ITEM_TIP", "emmets");
        break;
        
    case ITEM_BUILD_PATHWAY:
        if (ds_list_size(object_buildman.buildingList) >= MAX_YARDS){
            return translate("ITEM_TIP", "maxYards");
        }
        return translate("ITEM_TIP", "emmets");
        break;
        
    case ITEM_DROP_OBJECT:
        return translate("ITEM_TIP", "nothingToDrop");
        break;
        
    case ITEM_CALL_EMMET:
        if (crewMembersRemaining() <= 0){
            return translate("ITEM_TIP", "emptyCrew");
        }
        else{
            return translate("ITEM_TIP", "power");
        }
        break;
}
