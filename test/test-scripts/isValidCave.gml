///isValidCave(cavemap)

var cave = argument0;

if (!is_undefined(cave) &&
    ds_exists(cave, ds_type_map) &&
    is_real(cave[? CAVE_SEED]) &&
    is_real(cave[? CAVE_LEVEL]) &&
    !is_undefined(cave[? CAVE_BONUS]) &&
    !is_undefined(cave[? CAVE_MALUS]) &&
    !is_undefined(cave[? CAVE_WORLD]) &&
    !is_undefined(cave[? CAVE_PLANET])
    ){
    return true;   
}
return false;
