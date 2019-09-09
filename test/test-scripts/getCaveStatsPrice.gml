///getCaveStatsPrice(_MALUS, _BONUS)
var price = 0;
switch (argument0){
    case CAVE_MALUSES.MORE_HARDROCK: 
        price +=1000;
        break;
        
    case CAVE_MALUSES.RESSOURCES_POOR: 
    case CAVE_MALUSES.RESIDUALS:
        price -=200;
        break;
        
    case CAVE_MALUSES.SMALL_CAVE: 
        price -=300;
        break;
}

switch(argument1){
    case CAVE_BONUSES.LARGE_CAVE:
        price += 300;
        break;
        
    case CAVE_BONUSES.WATER_PRESENCE:
        price -= 100;
        break;
        
    case CAVE_BONUSES.RESSOURCES_RICH:
    case CAVE_BONUSES.CRYSTALLINE:
        price += 2000;
        break;
}

return price;
