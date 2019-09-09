///getHealPrice(crewMember)
var hp = argument0[? "hp"]; 
var missing = 100-hp;
var price = EMMET_MARKET_PRICE;

var healPrice = floor((missing/100)*price);

return healPrice;
