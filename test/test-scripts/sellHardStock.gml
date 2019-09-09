///sellHardStock(rsc, amount)
var rsc = argument0;
var amount = argument1;

if (amount == 0){
    return false;
}

var valBefore = getHardStock(rsc);
remHardStock(rsc, amount);
var valAfter = getHardStock(rsc);

var income = getCurrentPrice(rsc)*(valBefore-valAfter);

addFunds(income);

if (is_undefined(object_market.lastSales[? rsc])){
    object_market.lastSales[? rsc] = 0;
}
object_market.lastSales[? rsc] ++;
