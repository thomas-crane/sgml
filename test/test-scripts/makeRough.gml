///makeRough(loot/rsc)
var map = argument0;
var rscs = getBuildingMaterials();

for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    var rough = "rough"+string_upper(string_char_at(rsc, 0))+string_delete(rsc, 1, 1);
    
    if (is_undefined( map[? rsc])){
        continue;
    }
    if (is_undefined(map[? rough])){
        map[? rough] = 0;
    }
    map[? rough] += map[? rsc];
    map[? rsc] = 0;
}

return map;
