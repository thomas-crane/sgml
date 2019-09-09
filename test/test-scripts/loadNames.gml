///loadNames()
if (file_exists(object_disk.namesFile)){
    var file = file_text_open_read(object_disk.namesFile);
    var names = array("Rackover");
    while (!file_text_eof(file)){
        var line = file_text_readln(file);
        line = string_delete(line, string_length(line)-1, string_length(line));
        line = escapeString(line);
        if (string_length(line) <= 0){
            continue;
        }
        names[array_length_1d(names)] = line;
    }
    file_text_close(file);
    return names;
}
log("WARNING : Could not find name file on "+object_disk.namesFile);
return array("Happy employee");
