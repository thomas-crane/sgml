///formatStatistics(object_game.statistics)

var map = argument0;
var key = ds_map_find_first(map);
var size = ds_map_size(map);

var left = array(translate("STATISTICS", key));
var right = array(string(map[?key]));

/// Temp
var str = '';
str += translate("STATISTICS", key)+": "+string(map[? key])+"#";

for (var i = 0; i < size; i++){
    key = ds_map_find_next(map, key);
    left[array_length_1d(left)] = translate("STATISTICS", key);
    right[array_length_1d(right)] = string(map[? key]);
    
    if (is_undefined(map[? key])){
        continue;
    }
    // Temp
    str += translate("STATISTICS", key)+": "+string(map[? key])+"#";
}

///Temp
return str;

/// End of

return array(left, right);
