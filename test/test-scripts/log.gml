///log(str_info, *str_origin='', *logFile=EMMETS.LOG)

if ((DEBUG && (DEBUG_MAPS || object_debug.debug)) || debugParamGet("enableLogging")){
    var fname = "LOG/"+string("EMMETS")+".LOG";
    var file = noone;
    if (argument_count > 2){
        fname = "LOG/"+string(argument[2]);
    }
    
    if (!file_exists(fname)){
        file = file_text_open_write(fname);
        show_debug_message("Creating log file..."+string(file));
        file_text_write_string(file, "---- LOG START ----");
        file_text_close(file);
    }
    
    file = file_text_open_append(fname);
    
    if (file > 0){
        var thisLine = string(get_timer())+" - ";
        if (argument_count > 1){
            thisLine += "["+makeLong(argument[1], 24)+"] ";
        }
        else{
            thisLine += "["+makeLong(object_get_name(object_index), 24)+"] ";
        }
        
        thisLine += string(argument[0]);
        show_debug_message("LOG: "+thisLine);
        
        file_text_writeln(file);
        file_text_write_string(file, thisLine);
        file_text_close(file);
    }
}
else{
    return true;
}
