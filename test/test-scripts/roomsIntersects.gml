///roomsIntersects(arr_x1y1x2y2, arr_x1y1x2y2, int_margin)
var r1 = argument[0];
var r2 = argument[1];
var margin = argument[2];
var inter = false;

if (rectangle_in_rectangle(r1[0], r1[1], r1[2], r1[3], r2[0]-margin, r2[1]-margin, r2[2]+margin, r2[3]+margin)){
    inter = true;
}
return inter;

