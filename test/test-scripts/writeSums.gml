///writeSums()
with (object_disk){
    var sumPath = securityPath+"/SUMS";
    if (file_exists(sumPath)){
        file_delete(sumPath);
    }
    var file = file_text_open_write(sumPath);
    var sumsString = ds_map_write(sums);
    file_text_write_string(file, sumsString);
    file_text_close(file);
}
loadSums();
