///addToStat(str_stat, int_amount)
var stat = argument0;
if (is_undefined(object_game.statistics[? stat])){
    return false;
}
else{
    object_game.statistics[? stat] += argument1;
}
