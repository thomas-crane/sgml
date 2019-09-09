///onlineSendEmmet(json_crewMember)
// Sends an emmet to the online market

var emmetJson = argument0;
var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "sendEmmet";

onlineQuery(action, emmetJson, token, name);
