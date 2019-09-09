///gridCorridor(grid, arr_x1y1x2y2, arr_x1y1x2y2, TYPE_, *bonusWidth=0, *centerCorridor=true)

var bw = 0; //Bonus width
var centeredCorridors = true; //centered ?

var createdCorridors = ds_list_create();

if (argument_count > 4){
    bw = argument[4];
}
if (argument_count > 5){
    centeredCorridors = argument[5];
}

var prevRoom = argument[1];
var thisRoom = argument[2];

var prevCenter = array(round(random(prevRoom[2] - prevRoom[0]) + prevRoom[0]), round(random(prevRoom[3] - prevRoom[1]) + prevRoom[1]));
var thisCenter = array(round(random(thisRoom[2] - thisRoom[0]) + thisRoom[0]), round(random(thisRoom[3] - thisRoom[1]) + thisRoom[1]));


if (centeredCorridors){
    prevCenter = array(round((prevRoom[0] + prevRoom[2])/2), round((prevRoom[1] + prevRoom[3])/2));
    thisCenter = array(round((thisRoom[0] + thisRoom[2])/2), round((thisRoom[1] + thisRoom[3])/2));
}

if (random(2) > 1){ //x doesnt move, vertical corridor then horizontal  |_

    ds_grid_set_region(argument[0], prevCenter[0]+bw, prevCenter[1], prevCenter[0], thisCenter[1], argument[3]);
    ds_list_add(createdCorridors, array(prevCenter[0]+bw, prevCenter[1], prevCenter[0], thisCenter[1]));
    
    ds_grid_set_region(argument[0], prevCenter[0], thisCenter[1]-bw, thisCenter[0], thisCenter[1], argument[3]);
    ds_list_add(createdCorridors, array(prevCenter[0], thisCenter[1]-bw, thisCenter[0], thisCenter[1]));
}
else{ //else, horizontal corridor then vertical  _|

    ds_grid_set_region(argument[0], prevCenter[0], prevCenter[1]+bw, thisCenter[0], prevCenter[1], argument[3]);
    ds_list_add(createdCorridors, array(prevCenter[0], prevCenter[1]+bw, thisCenter[0], prevCenter[1]));
    
    ds_grid_set_region(argument[0], thisCenter[0]-bw, prevCenter[1], thisCenter[0], thisCenter[1], argument[3]);
    ds_list_add(createdCorridors, array(thisCenter[0]-bw, prevCenter[1], thisCenter[0], thisCenter[1] ));
}    

return createdCorridors;
