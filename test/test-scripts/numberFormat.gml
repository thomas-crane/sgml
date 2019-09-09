///numberFormat(number)
var number = real(argument0);
var finalString = string(number);

if (number > 999999){
    finalString = string(floor(number/100000)/10)+"M ";
}
else if (number > 99999){
    finalString = string(floor(number/10000)*10)+"k ";
}
else if (number > 999){
    var thousandPart = floor(number/1000);
    var cents = number - thousandPart*1000;
    finalString = string(thousandPart)+" "+padWithZeroes(string(cents), 3);
}

return finalString;
