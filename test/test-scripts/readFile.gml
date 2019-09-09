///readFile(path)

var filePath = argument0;
var result;
if (!file_exists(filePath)) return false;
if (debugParamGet("disableCrypt")){
    var file = file_text_open_read(filePath);
    var content = file_text_read_string(file);
    result = json_decode(content);
    file_text_close(file);
}
else{
    var str = loadCrypt(filePath, object_disk.keyFilePath);
    result = json_decode(str);
}
return result;
