///loadSums()
with (object_disk){
    ds_map_logdestroy(sums);
    sums = ds_map_logcreate();
    var sumPath = securityPath+"/SUMS";
    if (file_exists(sumPath)){
        var file = file_text_open_read(sumPath);
        var sumsString = file_text_read_string(file);
        ds_map_read(sums, sumsString);
        file_text_close(file);
    }
}
