///url64_encode(str)
var str = base64_encode(argument0);
str = string_replace_all(str, "+", "-");
str = string_replace_all(str, "/", "_");
str = string_replace_all(str, "=", "$");

return str;


