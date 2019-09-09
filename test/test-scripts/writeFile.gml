///writeFile(string, str_type_station_crew_stocks)
var sum = string_upper( md5_string_unicode(argument0));
var fullPath = object_disk.savePath;

switch (argument1){
    case "company":
        fullPath = object_disk.companyPath+"/"+sum;
        break;
        
    case "crew":
        fullPath = object_disk.crewPath+"/"+sum;
        break;
        
    case "stocks":
        fullPath = object_disk.stocksPath+"/"+sum;
        break;
        
    case "misc":
        fullPath = object_disk.miscPath+"/"+sum;
        break;
}

if (file_exists(fullPath)){
    file_delete(fullPath);
}

if (debugParamGet("disableCrypt")){
    var file = file_text_open_write(fullPath);
    //log("Opened ["+fullPath+"] for writing, preparing to write "+makeLong(argument0, 15)+"... inside", "WriteFile");
    file_text_write_string(file, argument0);
    file_text_close(file);
}
else{
    saveCrypt(argument0, fullPath, object_disk.keyFilePath);
}
if (!is_undefined(object_disk.sums[? argument1]) && file_exists(object_disk.sums[? argument1])){
    file_delete(object_disk.sums[? argument1]);
}
object_disk.sums[? argument1] = sum;

writeSums();

