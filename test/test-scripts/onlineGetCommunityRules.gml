///onlineGetCommunityRules()

var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "getCommunityRules";
var data = '';

onlineQuery(action, data, token, name);
