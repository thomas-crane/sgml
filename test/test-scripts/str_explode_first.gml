///str_explode_first(string, delimiter)

var str = argument0;
var splitBy = argument1; //string to split the first string by

var slot = 0;
var finalArr; //array to hold all splits
var str2 = ""; //var to hold the current split we're working on building

var i;
for (i = 1; i < (string_length(str)+1); i++) {
    var currStr = string_copy(str, i, 1);
    if (currStr == splitBy && slot == 0) {
        finalArr[slot] = str2; //add this split to the array of all splits
        slot++;
        str2 = "";
    } else {
        str2 = str2 + currStr;
        finalArr[slot] = str2;
    }
}        

return finalArr;
