///destroyWall(array_iso_index, *integrityDamage=50)
var ii = argument[0];
var integrityDamage = 30;
if (argument_count > 1){
    integrityDamage = argument[1];
}
var sl = object_masterselector.selection;
if (hasSelection(WALL) && sl[0] == ii[0] && sl[1] == ii[1]){
    clearSelection();
}
var map = getWallMap(ii);
var loot = ds_map_find_value(map, "loot");
var ressources = getRessources();
if (!is_undefined(loot)){
    for (var i = 0; i < array_length_1d(ressources); i++){
        var amount = ds_map_find_value(loot, ressources[i]);
        for (var j = 0; j < amount; j++){
            instance_create(ii[0]*G_CELLSIZE + random(G_CELLSIZE), ii[1]*G_CELLSIZE + random(G_CELLSIZE), getRessource(ressources[i], "object"));
        }
    }
}
damageIntegrity(integrityDamage);
remWall(ii);
addGravel(ii);
var ex = instance_create(ii[0]*G_CELLSIZE, ii[1]*G_CELLSIZE, object_vision_explorer);
ex.range = 3;
instance_create(ii[0]*G_CELLSIZE+G_CELLSIZE/2, ii[1]*G_CELLSIZE+G_CELLSIZE/2, object_fx_landslide);
