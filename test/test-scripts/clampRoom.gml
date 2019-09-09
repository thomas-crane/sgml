///clampRoom(arr_x1y1x2y2, gridWidth, gridHeight)
var r1 = argument[0];

for (var i = 0; i < array_length_1d(r1); i++){
    if (i == 0 || i == 2){
        r1[i] = clamp(r1[i], 0, argument[1]-1);
    }
    else{
        r1[i] = clamp(r1[i], 0, argument[2]-1);
    }
}

return r1;

