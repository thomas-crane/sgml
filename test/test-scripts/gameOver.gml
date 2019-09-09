///gameOver()
var ge = instance_create(0,0, object_game_ender);
ge.endFlag = ENDING_TELEPORT;
if (instance_exists(object_ui_window)){
    closeWindow(object_ui_window);
}
