///emmetDropObject(id)
with (argument0){
    if (instance_exists(holding)){
        holding.pickedUp = noone;
        if (holding.object_index == object_pickable_fuel){
            playSfx(sound_sfx_material_glass_drop, true, id);
        }
        else{
            playSfx(sound_sfx_material_heavy_drop, false, id);
        }
    }
    holding = noone;
}
