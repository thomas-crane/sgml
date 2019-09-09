///displaySnap(array(x, y))
var pos = (argument0);
pos = displayToSys(pos);
pos = snapToGrid(pos);
pos = sysToDisplay(pos);

return pos;
