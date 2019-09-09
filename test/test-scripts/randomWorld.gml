///randomWorld(bonus, malus)
var world = choose(WORLDTYPE_DIRT, WORLDTYPE_ICE, WORLDTYPE_LAVA);
if (argument0 == CAVE_BONUSES.WATER_PRESENCE && world == WORLDTYPE_LAVA){
    world = choose (WORLDTYPE_DIRT, WORLDTYPE_ICE);
}
if (argument1 == CAVE_MALUSES.LAVA_PRESENCE && world == WORLDTYPE_ICE){
    world = choose (WORLDTYPE_DIRT, WORLDTYPE_LAVA);
}

return world;
