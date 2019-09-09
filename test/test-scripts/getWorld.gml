///getWorld(WORLDTYPE_, need)
var tileDirt = tile_wall_dirt;
var tileHardrock = tile_wall_hardrock;
var tileUnbreakable = tile_wall_unbreakable;
var tileGravel = tile_gravel;
var tileGround = tile_ground;
var color = 339022; /// dark brown
var bgs = sound_bgs_cave;

switch (argument0){
    case WORLDTYPE_ICE:
         tileDirt = tile_wall_dirt_ice;
         tileHardrock = tile_wall_hardrock_ice;
         tileUnbreakable = tile_wall_unbreakable_ice;
         tileGravel = tile_gravel_ice;
         tileGround = tile_ground_ice;
         color = 15514727; /// light blue
        break;


    case WORLDTYPE_LAVA:
         tileDirt = tile_wall_dirt_lava;
         tileHardrock = tile_wall_hardrock_lava;
         tileUnbreakable = tile_wall_unbreakable_lava;
         tileGravel = tile_gravel_lava;
         tileGround = tile_ground_lava;
         color = 863101; /// reddish brown
        break;
}

switch (argument1){
    case TERRAIN_WALL_DIRT:
        return tileDirt;
        break;
    case TERRAIN_WALL_HARDROCK:
        return tileHardrock;
        break;
    case TERRAIN_WALL_UNBREAKABLE:
        return tileUnbreakable;
        break;
    case TERRAIN_WALL_CLEAR:
        return tileGround;
        break;
    case GRAVEL:
        return tileGravel;
        break;
        
    case WORLD_COLOR:
        return color;
        break;
        
    case WORLD_BGS:
        return bgs;
        break;
}
