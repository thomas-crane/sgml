///getSurroundingsIndex(array_iso_index, int_size)

var size = argument1;
var region = array(argument0[0], argument0[1], argument0[0] + size-1, argument0[1]+size-1);
if (argument0[0]+size+1 < 0 ||
     argument0[1]+size+1 < 0){
    return false;     
}
var doneGrid = ds_grid_create(argument0[0]+size+1, argument0[1]+size+1);

ds_grid_clear(doneGrid, false);
var result = array(-1);

for (var i = argument0[0]; i < argument0[0]+size; i++){
    for (var j = argument0[1]; j < argument0[1]+size; j++){
        ds_grid_set(doneGrid, i, j, true);
    }
}
for (var i = argument0[0]; i < argument0[0]+size; i++){
    for (var j = argument0[1]; j < argument0[1]+size; j++){
        var singleSurround = array(array(i+1, j), 
                                array(i-1, j), 
                                array(i, j+1), 
                                array(i, j-1));
        for (var k = 0; k < array_length_1d(singleSurround); k++){
            var thisSurround = singleSurround[k];
            clampSelect(thisSurround, object_game.gridSize);
            
            if (!ds_grid_get(doneGrid, thisSurround[0], thisSurround[1])){
                ds_grid_set(doneGrid, thisSurround[0], thisSurround[1], true)
                if (result[0] == -1){
                    result[0] = array(thisSurround[0], thisSurround[1]);
                }
                else{
                    result[array_length_1d(result)] = thisSurround;
                }
            }
        }
    }
}

ds_grid_destroy(doneGrid);

return result;


