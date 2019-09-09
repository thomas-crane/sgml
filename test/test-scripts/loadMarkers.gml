///loadMarkers()
var path = object_disk.markerFilePath;

if (!file_exists(path)){
    /// do nothing
}
else{
    var f = file_text_open_read(path);
    ds_map_logdestroy(object_game.markers);
    object_game.markers = json_decode(file_text_read_string(f));
    file_text_close(f);
}
