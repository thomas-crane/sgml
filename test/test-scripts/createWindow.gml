///createWindow(*title, *text, *array3_buttons_functions_parameters, *customInterior = false)

var minDepth = HUD_DEPTH-4;
for (var i = 0; i < instance_number(object_ui_window); i++){
    var win = instance_find(object_ui_window, i);
    if (win.depth <= minDepth){
        minDepth = win.depth-3;
    }
}

var w = instance_create(0,0, object_ui_window);
w.depth = minDepth;
if (argument_count>0){
    w.title = argument[0];
}
if (argument_count>1){
    w.text = argument[1];
}

if (argument_count>2 && array_length_1d(argument[2]) == 3){
    var but = argument[2];
    w.buttons = but[0];
    w.buttonsFunctions = but[1];
    w.buttonsParameters = but[2];
}
if (argument_count>3){
    w.customInterior = argument[3];
}



return w;
