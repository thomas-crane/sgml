///getRule(RULE_, *cave=global.currentCave)
var cave = noone;
if (argument_count > 1){
    cave = argument[1];
}
else{
    cave = global.currentCave;
}
if (instance_exists(object_game)){

    var thisRule = argument[0];
    
    switch (thisRule){
        case RULE_SIZE:
            
            if (cave[? CAVE_BONUS] == CAVE_BONUSES.LARGE_CAVE){
                return array(64, 64);
            }
            else if (cave[? CAVE_MALUS] == CAVE_MALUSES.SMALL_CAVE){
                return array(40, 40);
            }
            else{
                return array(48, 48);    
            }
            break;
            
        case RULE_OXYGEN:
            if (cave[? CAVE_BONUS] == CAVE_BONUSES.SEALING){
                return 0.65;
            }
            else if (cave[? CAVE_BONUS] == CAVE_MALUSES.POOR_SEALING){
                return 1.5;
            }
            else{
                return 1;
            }
            break;
    }
    
}
