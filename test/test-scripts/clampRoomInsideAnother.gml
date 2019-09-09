///clampRoomInsideAnother(arr_x1y1x2y2, arr_x1y1x2y2)
var r1 = argument[0];
var r2 = argument[1];

for (var i = 0; i < array_length_1d(r1); i++){
    if (i==0 || i==2){
        r1[i] = clamp(r1[i], r2[0], r2[2]);
    }
    else{
        r1[i] = clamp(r1[i], r2[1], r2[3]);
    }
}

return r1;

