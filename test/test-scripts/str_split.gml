///str_split(string)
//Renvoie une array où chaque élément est un character du string originel

var str = argument0;
var finalArr = array(0);
for (i=0;i<string_length(str);i++){
    finalArr[i] = string_char_at(str,i+1);
}

return finalArr;
