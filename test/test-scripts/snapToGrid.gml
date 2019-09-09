///snapToGrid(array(x, y))
var pos = (argument0);
var sysGridPos = array(floor(pos[0]/G_CELLSIZE)*G_CELLSIZE, floor(pos[1]/G_CELLSIZE)*G_CELLSIZE);

return sysGridPos;
