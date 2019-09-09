///maxStat(str_stat, int_value)
var stat = argument0;
if (is_undefined(object_game.statistics[? stat])){
    return false;
}
else{
    object_game.statistics[? stat] = max(object_game.statistics[? stat], argument1);
}
