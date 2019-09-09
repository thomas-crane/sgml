///escapeString(str);

var str = argument0;
var forbidden = array ( "#", '"', "'", ";", "`");
for (var i = 0; i < array_length_1d(forbidden); i++){
    str = string_replace_all(str, forbidden[i], "");
}

return str;
