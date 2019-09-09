///toggleVisualKeyboard()
if (instance_exists(object_ui_window_keyboard)){
    with(object_ui_window_keyboard){
        closeWindow(hostWindow);
        closeWindow();
    }
}
else{
    instance_create(0,0,object_ui_window_keyboard);
}
