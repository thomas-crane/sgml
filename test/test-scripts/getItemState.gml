///getItemState(ITEM_, mixed_subject)
switch argument0{
    case ITEM_POWER:
        if (argument1.powerSwitch){
            return 0;
        }
        else{
            return 1;
        }
        break;   
        
    case ITEM_DRILL_WALL:
        if (isMarkedToDrill(argument1)){
            return 1;
        }
        else{
            return 0;
        }
        break;
        
    case ITEM_DYNAMITE_WALL:
        if (isMarkedToDynamite(argument1)){
            return 1;
        }
        else{
            return 0;
        }
        break;
        
    case ITEM_CLEAR_GRAVEL:
        if (isMarkedToClear(argument1)){
            return 1;
        }
        else{
            return 0;
        }
        break;
}
return 0;
