///displayToSys(array(x,y))

var LocalX = argument0[1] + (argument0[0] - room_width/2) / G_RATIO;
var LocalY = argument0[1] - (argument0[0] - room_width/2) / G_RATIO;

/*
switch (object_debug.debugRotation){
    case 1:
        LocalX = -LocalY;
        LocalY = LocalX;
        break;
    case 2:
        LocalX = -LocalX;
        break;
}
*/
return array(LocalX, LocalY);
