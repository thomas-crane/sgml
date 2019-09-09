///forkCave(ds_map_lastcave, *forksize=2)
//Returns a list of two new caves based on the previous one

/* format of a cave
    cave{
        bonus: caractéristique négative unique
        malus: caractéristique opsitive unique
        level: int (moins d'oxygène et de plus res avec al prodondeur)
        flags: ds_list()
        seed: int
    }

*/

var caveList = ds_list_create();
var forkSize = 2;   //unused for now
if (argument_count > 1){
    forkSize = argument[1];
}
var oldCave = argument[0];


var firstCave = ds_map_logcreate();
firstCave[? CAVE_SEED] = rrandom(10000000); 
random_set_seed(firstCave[? CAVE_SEED]);
firstCave[? CAVE_BONUS] = oldCave[? CAVE_BONUS];    //Same bonus as previous cave
firstCave[? CAVE_MALUS] = randomCaveStat(CAVE_MALUS, firstCave[? CAVE_BONUS]);
firstCave[? CAVE_LEVEL] = oldCave[? CAVE_LEVEL]+1;  //Level of new cave is old cave level +1
firstCave[? CAVE_WORLD] = randomWorld(firstCave[? CAVE_BONUS], firstCave[? CAVE_MALUS]);

var secondCave = ds_map_logcreate();
secondCave[? CAVE_SEED] = rrandom(10000000); 
random_set_seed(firstCave[? CAVE_SEED]);
secondCave[? CAVE_MALUS] = oldCave[? CAVE_MALUS];    //Same malus as previous cave
secondCave[? CAVE_BONUS] = randomCaveStat(CAVE_BONUS, secondCave[? CAVE_MALUS], firstCave[? CAVE_BONUS]);
secondCave[? CAVE_LEVEL] = oldCave[? CAVE_LEVEL]+1;  //Level of new cave is old cave level +1
secondCave[? CAVE_WORLD] = randomWorld(secondCave[? CAVE_BONUS], secondCave[? CAVE_MALUS]);

ds_list_add(caveList, firstCave);
ds_list_mark_as_map(caveList, ds_list_size(caveList)-1);

ds_list_add(caveList, secondCave);
ds_list_mark_as_map(caveList, ds_list_size(caveList)-1);
log("Generated first cave ["+string(firstCave)+"] "+json_encode(firstCave));
log("Generated second cave ["+string(secondCave)+"] "+json_encode(secondCave));

return caveList;
