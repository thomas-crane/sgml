///createDebugWindow(str_name, width, height)
var o = object_game.menuing;
object_set_persistent(object_ui_window, true);
hostWindow = createWindow(argument0, "", array(noone), true);
object_game.menuing = o;
hostWindow.width = argument1;
hostWindow.height = argument2;
hostWindow.isDebugWindow = true;
hostWindow.depth = CURSOR_DEPTH+10;
hostWindow.x = (SCREEN_WIDTH-hostWindow.width)/2;
hostWindow.y = (SCREEN_HEIGHT-hostWindow.height)/2;
object_set_persistent(object_ui_window, false);
