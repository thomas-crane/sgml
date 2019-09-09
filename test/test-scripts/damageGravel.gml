///damageGravel(gravel_array_xy_index, int_amount)
var gravelActHp = ds_map_find_value(getGravelMap(argument[0]), "hp");
ds_map_replace(getGravelMap(argument[0]), "hp", gravelActHp-argument[1]);
gravelActHp = ds_map_find_value(getGravelMap(argument[0]), "hp");

var ressources = getRessources();
var loot = ds_map_find_value(getGravelMap(argument[0]), "loot");
var size = 0;

if (is_undefined(loot)){
    return false;
}
for (var i = 0; i < array_length_1d(ressources); i++){
    if (ds_map_exists(loot, ressources[i]) && ds_map_find_value(loot, ressources[i]) > 0){
        size += ds_map_find_value(loot, ressources[i]);
    }
}


var alpha = (gravelActHp/100);
var breakAmount = 1-(alpha-0.5)*2;
var lootMoment = breakAmount * size;

groundmod_set_alpha(argument[0], alpha);

if (lootMoment > 1){
    for (var i = 0; i < array_length_1d(ressources); i++){
        if (ds_map_exists(loot, ressources[i]) && ds_map_find_value(loot, ressources[i]) > 0){
            var pos = argument[0];
            pos = array(pos[0]*G_CELLSIZE, pos[1]*G_CELLSIZE);
            instance_create(pos[0]+ random(G_CELLSIZE), pos[1]+ random(G_CELLSIZE), getRessource(ressources[i], 'object'));
            ds_map_replace(loot, ressources[i], ds_map_find_value(loot, ressources[i])-1);
            break;
        }
    }
}

if (gravelActHp <= 0){
    remGravel(argument[0]);
    addToStat("gravelCleared", 1);
}

