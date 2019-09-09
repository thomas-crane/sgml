var int = argument0;
var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var letters = "";

if (int <= 0){
    letters = "Ø";
}
while (int > 0){
    var letterInt = int%27;
    var letter = string_char_at(alphabet, letterInt);
    letters += letter;
    int -= 26;
}


return letters;
