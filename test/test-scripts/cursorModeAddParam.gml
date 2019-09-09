///cursorModeAddParam(param1, *param2, *param3...)
for (var i = 0; i < argument_count; i++){
    var thisParam = argument[i];
    
    if (instance_exists(object_pad)){
        ds_list_add(object_pad.cursorModeParams, thisParam);
    }
}
