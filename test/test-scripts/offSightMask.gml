///offSightMask(*margin, *hideIfInvisible)
var margin = 3;
var visibility = false;
if (argument_count > 0){
    margin = argument[0];
}
if (argument_count > 1){
    visibility = argument[1];
}

if (!isOnScreen(sysToDisplayX(x, y), sysToDisplayY(x, y), margin) ||
    (visibility && !isVisible(array(x/G_CELLSIZE, y/G_CELLSIZE)))){
    visible = false;
}
else{
    visible = true;
}
