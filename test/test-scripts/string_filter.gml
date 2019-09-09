///string_filter(string, charactersToReplace, *putInstead=_)

var replacer = "_";
if (argument_count > 2){
    replacer = argument[2];
}
for (var i = 0; i < string_length(argument[1]); i++){
    argument[0] = string_replace_all(argument[0], string_char_at(argument[1], i+1), replacer);
}
return argument[0];

