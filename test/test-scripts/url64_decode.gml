///url64_decode(str)
var str = argument0;
str = string_replace_all(str, "-", "+");
str = string_replace_all(str, "_", "/");
str = string_replace_all(str, "$", "=");
str = base64_decode(argument0);

return str;


