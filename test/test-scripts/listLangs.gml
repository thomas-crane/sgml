///listLangs()
var i = 0;
var fileName = file_find_first(object_disk.langPath + "/*.TXT", 0);
var fArray = array(noone);
while(fileName != '')
{
    fArray[i] = string_delete(fileName, string_length(fileName)-3, string_length(fileName));
    fileName = file_find_next();
    i ++;
}
file_find_close();
return fArray;
