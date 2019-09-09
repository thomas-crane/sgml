///translate(str_category, str_key)
if (!instance_exists(object_worldwide)){
    return "ERR: LINES NOT LOADED";
}
var lines = object_worldwide.lines;

var key = string(argument0);
var prop = string(argument1);

var cat = lines[? key];
if (is_undefined(cat) || !ds_exists(cat, ds_type_map)){
    line = "ERR: UNDEFINED CAT "+key;
    return line;
}
var line = cat[? prop];
if (is_undefined(line)){
    line = "ERR: UNDEFINED PROP "+prop+" IN CAT "+key;
    return line;
}

return string_delete(line, string_length(line)-1, 1);
