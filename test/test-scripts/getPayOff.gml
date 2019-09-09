///getPayOff(crewMember)
var trainings = argument0[? "trainings"]; 

var reduction = 0.1;

var overPrice = 0;
for (var i = 0; i < ds_list_size(trainings); i++){
    overPrice += getTrainingPrice(trainings[|i])*reduction;
}
var price = EMMET_MARKET_PRICE*reduction + overPrice;


return price;
