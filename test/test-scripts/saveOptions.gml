///saveOptions()
var path = object_disk.settingsPath;
var f = file_text_open_write(object_disk.settingsFilePath);
file_text_write_string(f, json_encode(object_game.settings));
file_text_close(f);

loadOptions();
