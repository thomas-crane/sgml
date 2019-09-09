///makeLong(str, int_length)
for (var i = string_length(argument[0]); i < argument[1]; i++){
    argument[0] += " ";
}
if (string_length(argument[0]) > argument[1]){
    argument[0] = string_delete(argument[0], argument[1]+1, string_length(argument[0]));
}

argument[0] = string_upper(argument[0]);
return argument[0];
