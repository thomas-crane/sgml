///isOnGameScreen(array_xy_or_x, *y)

var screenpos = array(0);
if (argument_count > 1){
    screenpos = array(argument[0], argument[1]);
}
else{
    screenpos = argument[0];
}

var onScreen = true;

/// Checking if cursor is on selection menu
if (instance_exists(object_selectedmenu) && hasSelection()){
    if (point_in_rectangle(screenpos[0], screenpos[1], 
            object_selectedmenu.x-object_selectedmenu.discardBarWidth, 
            object_selectedmenu.y, 
            view_xview+view_wview, 
            object_selectedmenu.height+object_selectedmenu.y)){
        onScreen = false;
    }
}

return onScreen
