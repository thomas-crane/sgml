///cursorModeSet(*CURSOR_MODE_DEFAULT)
var thisMode = CURSOR_MODE_DEFAULT;

if (argument_count > 0){
    thisMode = argument[0];
}

if (instance_exists(object_pad)){
    object_pad.cursorMode = thisMode;
    ds_list_clear(object_pad.cursorModeParams);
}
