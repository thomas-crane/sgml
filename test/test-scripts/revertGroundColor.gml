///revertGroundColor(ground_arr_index_xy)
var lastGround = argument[0];
if (!isVisible(lastGround)){
    //groundmod_set_colour(lastGround, c_black);
}
else if (!isMarkedToClear(lastGround)){
    groundmod_set_colour(lastGround, c_white);
}
else{
    groundmod_set_colour(lastGround, c_gray);
} 
