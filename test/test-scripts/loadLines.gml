///loadLines()
var lang = getSetting("lang");
ds_map_logdestroy(object_worldwide.lines);
object_worldwide.lines = ds_map_logcreate();

if (!file_exists(object_disk.currentLangPath)){
    log ("Locfile doesn't exist at "+object_disk.currentLangPath+"...aborting");
    exit;
} 

var file = file_text_open_read(object_disk.currentLangPath);

var ll = object_worldwide.lines;
var currentKey = "";

while (!file_text_eof(file)){
    

    var line = file_text_readln(file);
    switch (string_char_at(line, 1)){
        
        case "/":
            continue;
            break;
        
        case "[":
            currentKey = string_delete(line, string_length(line)-2, string_length(line));
            currentKey = string_delete(currentKey, 1, 1);
            break;
            
        default:
            var kv = str_explode_first(line, "=");
            if (array_length_1d(kv) < 2){
                break;
            }
            var map = ll[? currentKey];
            if (is_undefined(map)){
                map = ds_map_logcreate();
                ds_map_add_map(ll, currentKey, map);
                log("Adding line key "+currentKey);
            }
            var prop = kv[0];
            //var currentLine = string_delete(kv[1], string_length(kv[1])-2, string_length(kv[1]));
            var currentLine = kv[1];
            //currentLine = string_replace_all(currentLine, "\n", "");
            //currentLine = string_replace_all(currentLine, "\r", "");
            //currentLine = string_replace_all(currentLine, "\n\r", "");
            // This magic line of code removes linebreak...the X disappears
           
             currentLine = string_replace_all(currentLine, "
", string_char_at(currentLine, string_length(currentLine)-2));

            //currentLine = string_delete(currentLine, string_length(currentLine), 2);

            map[? prop] = currentLine;
            //log("Adding ["+currentKey+":"+prop+"] to category ["+currentKey+"]");
            //ds_map_add_map(ll, currentKey, map);
            //ll[? currentKey] = map;
            break;
    }
}
file_text_close(file);

