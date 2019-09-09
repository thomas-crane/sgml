///saveStocks()
/// Saves hardstock to disk

var stocksString = json_encode(object_station.stocks);
writeFile(stocksString, "stocks");
loadStocks();
