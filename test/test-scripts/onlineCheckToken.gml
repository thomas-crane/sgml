///onlineCheckToken(str_token)

var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "checkToken";
var data = argument0;

onlineQuery(action, data, token, name);
