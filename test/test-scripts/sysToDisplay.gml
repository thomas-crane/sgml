///sysToDisplay(array(xy))

var GlobalX =  room_width/2 + (argument0[0] - argument0[1]);
var GlobalY = (argument0[0] + argument0[1])/(G_RATIO);

/*
switch (object_debug.debugRotation){
    case 1:
        GlobalX = GlobalY;
        GlobalY = -GlobalX;
        break;
    case 2:
        GlobalX = -GlobalX;
        break;
}
*/
return array(GlobalX, GlobalY);
