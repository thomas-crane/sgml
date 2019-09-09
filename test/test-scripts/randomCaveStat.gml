///randomCaveStat(TYPE, compatibility, *not)
var blacklist = noone;
if (argument_count > 2){
    blacklist = argument[2];
}

switch(argument[0]){
    case CAVE_MALUS:
        var choice = -1;
        while (choice < 0){
            choice = choose(
                CAVE_MALUSES.POOR_SEALING,
                CAVE_MALUSES.LAVA_PRESENCE,
                CAVE_MALUSES.SMALL_CAVE,
                CAVE_MALUSES.MORE_HARDROCK,
                CAVE_MALUSES.RESIDUALS,
                CAVE_MALUSES.RESSOURCES_POOR,
                CAVE_MALUSES.ELECTRIC_VARIATION
            );
            if (argument_count > 1){
                var bonus = argument[1];
                if (!areCaveStatsCompatible(bonus, choice) || choice == blacklist){
                    choice = -1;
                }
            }
        }
        break;
        
    case CAVE_BONUS:
        var choice = -1;
        while (choice < 0){
            choice = choose(
                CAVE_BONUSES.LARGE_CAVE,
                CAVE_BONUSES.RESSOURCES_RICH,
                CAVE_BONUSES.NO_HARDROCK,
                CAVE_BONUSES.CRYSTALLINE,
                CAVE_BONUSES.SEALING,
                CAVE_BONUSES.WATER_PRESENCE
            );
            if (argument_count > 1){
                var malus = argument[1];
                if (!areCaveStatsCompatible(choice, malus) || choice == blacklist){
                    choice = -1;
                }
            }
        }
        break;
}

return choice;
