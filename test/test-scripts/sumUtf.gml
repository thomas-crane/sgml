///sumUtf(string)
var thisString = argument[0];
var sum = 0;
for (var i = 0; i < string_length(thisString); i++){
    sum += ord(string_char_at(thisString, i));
}
return sum;
