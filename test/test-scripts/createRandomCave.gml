///createRandomCave(*CAVE_LEVEL, *CAVE_PLANET)

var cave = ds_map_logcreate();
cave[? CAVE_SEED] = rrandom(10000000); 
random_set_seed(cave[? CAVE_SEED]);
cave[? CAVE_BONUS] = randomCaveStat(CAVE_BONUS);
cave[? CAVE_MALUS] = randomCaveStat(CAVE_MALUS, cave[? CAVE_BONUS]);

cave[? CAVE_LEVEL] = object_game.currentLevel;
if (argument_count > 0){
    cave[? CAVE_LEVEL] = argument[0];
}

cave[? CAVE_PLANET] = rrandom(PLANETS-1);
if (argument_count > 1){
    cave[? CAVE_PLANET] = argument[1];
}

cave[? CAVE_WORLD] = randomWorld(cave[? CAVE_BONUS], cave[? CAVE_MALUS]);

return cave;
