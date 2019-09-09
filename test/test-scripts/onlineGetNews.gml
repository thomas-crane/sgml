///onlineGetNews(int_historySize)

var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "getNews";
var data = argument0;

onlineQuery(action, data, token, name);
