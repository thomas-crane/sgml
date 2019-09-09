///getCurrentPrice(rsc, *backstep=0)
var backstep = 0;
if (argument_count > 1){
    backstep = argument[1];
}
var step = object_market.marketQueue[| ds_list_size(object_market.marketQueue)-1-backstep];

var value = exp((step[? argument[0]]-0.3)*2)*getRessource(argument[0], "price");

return max(0, value);
