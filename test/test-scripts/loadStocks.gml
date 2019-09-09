///loadStocks()

var sum = getSum("stocks");
if (is_undefined(sum)){
    log("Sum is missing from sumlist, could not load stocks", "LOADSTOCKS");
    return false;
}
var filePath = object_disk.stocksPath+"/"+sum;
var stocks = readFile(filePath);

var buildings = getBuildings();
for (var i = 0; i < array_length_1d(buildings); i++){
    var thisBuild = buildings[i];
    if (!is_undefined(stocks[? string(thisBuild)])){
        log('Found and loaded building '+object_get_name(thisBuild)+'');
        stocks[? thisBuild] = stocks[? string(thisBuild)];
        ds_map_delete(stocks, string(thisBuild));
    }
}

ds_map_logdestroy(object_station.stocks);
object_station.stocks = stocks;
return true
