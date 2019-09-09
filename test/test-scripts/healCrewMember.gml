///healCrewMember(crewMember, funds)
var funds = argument1;
var crewMember = argument0;

var price = getHealPrice(crewMember);

if (funds < price){
    var healPercent = funds/price;
    var lifeMissing = 100-crewMember[? "hp"];
    var lifeRestored = floor(healPercent*lifeMissing);
    crewMember[? "hp"] += lifeRestored;
    remFunds(price*healPercent);
}
else{
    crewMember[? "hp"] = 100;
    remFunds(price);
}

addToStat("moneySpentOnHealing", price);
