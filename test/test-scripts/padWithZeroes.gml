///padWithZeroes(string, int_zeroes, *pad_string)

var padding = "";
var padStr = string(0)
if (argument_count > 2){
    padStr = argument[2]
}

for(i = 0; i < argument[1] - string_length(string(argument[0])); i++){
    padding += padStr;
}
padding += argument[0];
return padding;
