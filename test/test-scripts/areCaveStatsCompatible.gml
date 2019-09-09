///areCaveStatsCompatible(bonus, malus)
switch (argument[0]){

    case CAVE_BONUSES.LARGE_CAVE:
        if (argument[1] == CAVE_MALUSES.SMALL_CAVE){
            return false;
        }
        break;
        
    case CAVE_BONUSES.RESSOURCES_RICH:
        if (argument[1] == CAVE_MALUSES.RESSOURCES_POOR){
            return false;
        }
        break;
        
    case CAVE_BONUSES.NO_HARDROCK:
        if (argument[1] == CAVE_MALUSES.MORE_HARDROCK){
            return false;
        }
        break;
        
    case CAVE_BONUSES.CRYSTALLINE:
        if (argument[1] == CAVE_MALUSES.RESIDUALS){
            return false;
        }
        break;
        
    case CAVE_BONUSES.SEALING:
        if (argument[1] == CAVE_MALUSES.POOR_SEALING){
            return false;
        }
        break;
        
    case CAVE_BONUSES.WATER_PRESENCE:
        if (argument[1] == CAVE_MALUSES.LAVA_PRESENCE){
            return false;
        }
        break;
}

return true;
