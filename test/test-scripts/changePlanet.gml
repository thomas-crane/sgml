///changePlanet(int_newPlanetId)
object_selectcave.currentPlanet = argument0;
object_selectcave.panned = false;

if (!lastCaveIsHistory()){
    ds_map_logdestroy(object_game.lastCave);
}
object_game.lastCave = createRandomCave(1);
log("Set last cave to "+json_encode(object_game.lastCave )+"");
object_game.currentLevel = 1;
populateCaveSelector();
log("Populated cave selector, last cave is "+json_encode(object_game.lastCave ));
