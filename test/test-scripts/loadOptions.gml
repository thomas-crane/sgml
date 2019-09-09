///loadOptions()
var path = object_disk.settingsPath;

if (!file_exists(object_disk.settingsFilePath)){
    saveOptions();
}
else{
    var f = file_text_open_read(object_disk.settingsFilePath);
    var newMap = json_decode(file_text_read_string(f));
    
    var current_key = ds_map_find_first(object_game.settings);
    var size = ds_map_size(object_game.settings);
    
    for (var i = 0; i < size; i++){
    
        if (object_game.settings[? current_key] != newMap[? current_key] &&
            !is_undefined(newMap[? current_key])
            ){
            if (current_key == "priorities" && 
                ds_exists(object_game.settings[? current_key], ds_type_list)){
                ds_list_copy(object_game.settings[? current_key], newMap[? current_key]);
            }
            else{
                object_game.settings[? current_key] = newMap[? current_key];
            }
        }
    
        current_key = ds_map_find_next(object_game.settings, current_key);
    }
    
    ds_map_logdestroy(newMap);
    file_text_close(f);
}
object_disk.currentLangPath = object_disk.langPath+"/"+getSetting("lang")+".TXT";
