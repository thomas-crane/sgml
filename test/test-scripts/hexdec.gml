///hexdec(str_char)
if (string_digits(argument0) == argument0){
    return real(argument0);
} 
var char = string_upper(argument0);

switch (char){

    case "A":
        return 10;
        break;
    case "B":
        return 11;
        break;
    case "C":
        return 12;
        break;
    case "D":
        return 13;
        break;
    case "E":
        return 14;
        break;
    case "F":
        return 15;
        break;
}
