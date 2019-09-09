///onChunk(array_xy_index, object)
var indexPos = array((argument0[0]), (argument0[1]));
var col = collision_point(indexPos[0]*G_CELLSIZE, indexPos[1]*G_CELLSIZE, argument1, true, false);
if (col > -1){
    return col;
}
else{
    return noone;
}
