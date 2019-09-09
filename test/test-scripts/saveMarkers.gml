///saveMarkers(str_marker)

var path = object_disk.markerFilePath;
var f = file_text_open_write(path);
file_text_write_string(f, json_encode(object_game.markers));
file_text_close(f);

loadMarkers();
