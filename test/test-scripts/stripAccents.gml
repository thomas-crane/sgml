///stripAccents(str)
var str = argument0;
str = string_replace_all(str, "é", "e");
str = string_replace_all(str, "è", "e");
str = string_replace_all(str, "ê", "e");
str = string_replace_all(str, "à", "a");
str = string_replace_all(str, "â", "a");
str = string_replace_all(str, "ô", "o");
str = string_replace_all(str, "ò", "o");
str = string_replace_all(str, "û", "u");
str = string_replace_all(str, "ù", "u");
str = string_replace_all(str, "î", "i");
str = string_replace_all(str, "ì", "i");
str = string_replace_all(str, "ñ", "n");

return str;
