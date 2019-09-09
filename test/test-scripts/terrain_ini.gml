/// terrain_ini(w,h,[value,tileset],...)
/// initialise les tiles à utiliser pour la map

var w = argument[0]
var h = argument[1]

// stocke les tilesets à utiliser
for(var i=2; i<argument_count; i+=2)
    {
    var value = argument[i]
    var tileset = argument[i+1]
    global.terrain_walls_tilesets[value] = tileset
    }

// crée le tableau contenant les id des tiles
for(var i=0; i<w*h; i++)
    {
    global.terrain_walls_tiles[i, 0] = noone // LAYER_LOW
    global.terrain_walls_tiles[i, 1] = noone // LAYER_HIGH
    global.terrain_walls_tiles[i, 2] = false // est complètement entouré par d'autres tiles
    }

var low = 0
var high = 1
var both = 2

// définit le layer à utiliser pour chaque tile du tileset
global.terrain_layer[0,0] = high
global.terrain_layer[0,1] = high
global.terrain_layer[0,2] = both
global.terrain_layer[0,3] = high
global.terrain_layer[0,4] = low
global.terrain_layer[0,5] = low
global.terrain_layer[0,6] = high
global.terrain_layer[0,7] = low

global.terrain_layer[1,0] = high
global.terrain_layer[1,1] = high
global.terrain_layer[1,2] = low
global.terrain_layer[1,3] = high
global.terrain_layer[1,4] = low
global.terrain_layer[1,5] = high
global.terrain_layer[1,6] = high
global.terrain_layer[1,7] = low

global.terrain_layer[2,0] = both
global.terrain_layer[2,1] = low
global.terrain_layer[2,2] = low
global.terrain_layer[2,3] = both
global.terrain_layer[2,4] = both
global.terrain_layer[2,5] = high
global.terrain_layer[2,6] = both
global.terrain_layer[2,7] = noone

global.terrain_layer[3,0] = both
global.terrain_layer[3,1] = both
global.terrain_layer[3,2] = both
global.terrain_layer[3,3] = both
global.terrain_layer[3,4] = both
global.terrain_layer[3,5] = both
global.terrain_layer[3,6] = low
global.terrain_layer[3,7] = noone

global.terrain_layer[4,0] = both
global.terrain_layer[4,1] = both
global.terrain_layer[4,2] = both
global.terrain_layer[4,3] = both
global.terrain_layer[4,4] = both
global.terrain_layer[4,5] = high
global.terrain_layer[4,6] = both
global.terrain_layer[4,7] = noone

global.terrain_layer[5,0] = both
global.terrain_layer[5,1] = both
global.terrain_layer[5,2] = high
global.terrain_layer[5,3] = both
global.terrain_layer[5,4] = noone
global.terrain_layer[5,5] = both
global.terrain_layer[5,6] = low
global.terrain_layer[5,7] = noone

global.terrain_layer[6,0] = both
global.terrain_layer[6,1] = both
global.terrain_layer[6,2] = high
global.terrain_layer[6,3] = low
global.terrain_layer[6,4] = noone
global.terrain_layer[6,5] = noone
global.terrain_layer[6,6] = noone
global.terrain_layer[6,7] = noone
