///onlineGetSurroundingLeaderboards(company_cid)

var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "getSurroundingLeaderboard";
var data = argument0;

onlineQuery(action, data, token, name);
