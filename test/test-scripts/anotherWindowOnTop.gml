///anotherWindowOnTop

somethingIsOnTop = false;
with (object_ui_window){
    if (depth <= other.depth && !isDebugWindow && 
                                (drawFullBackground || 
                                drawCheckerboard)){
        other.somethingIsOnTop = true;
    }
}

return somethingIsOnTop;
