///onlineGetMarket(int_historySize)

var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "getMarketQueue";
var historySize = argument0;

onlineQuery(action, historySize, token, name);
