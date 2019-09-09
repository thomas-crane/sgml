///getLangTranslation(TRANSLATE_, str_ITEM_RSC_BUILD_STR)
/*
var lang = getSetting("lang");
if (is_undefined(lang)){
    lang = "ENGLISH";
}
var path = "LNG/"+string_upper(lang)+".LNG";
ini_open(path);
if (!file_exists(path)){
    ini_write_real("MISC", "VERSION", 0.62);
}

var translation = ini_read_string(string(argument[0]), string(argument[1]), "???");
ini_close();

return translation;
*/
