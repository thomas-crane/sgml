///generateCaveName(cave)
var cave = argument0;
var name = ""; 
name += string_upper(string_delete(translate("EMMET_BIRTHPLACE", cave[? CAVE_PLANET]), 4, 100));
name += "-";
name += intToLetters(cave[? CAVE_LEVEL]-1);
name += "-";
name += intToLetters(26-cave[? CAVE_WORLD]+1);
name += padWithZeroes(string(cave[? CAVE_SEED]), 8);

return name;
