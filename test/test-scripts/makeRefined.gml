///makeRefined(loot)
var map = argument0;
var rscs = getRoughMaterials();

for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    
    if (!isRoughMaterial(rsc) || is_undefined( map[? rsc])){
        continue;
    }
    
    var refined = string_replace(rsc, "rough", "");
    refined = string_lower(string_char_at(refined, 0))+string_delete(refined, 1, 1);
    
    if (is_undefined(map[? refined])){
        map[? refined] = 0;
    }
    map[? refined] += map[? rsc];
    map[? rsc] = 0;
}

return map;
