///getMarketBounds()

var marketHistory = object_market.marketHistory;
var rscs = getFancyMaterials();
var maxValue = 1;
var minValue = 1;

for (var i = 0; i < marketHistory; i++){
    for (var j = 0; j < array_length_1d(rscs); j++){
        var rsc = rscs[j];
        var step = object_market.marketQueue[| i];
        value = step[? rsc];
        if(value > maxValue){
            maxValue = value;
        }
        if(value < minValue){
            minValue = value;
        }
    }
}
return array(maxValue, minValue);
