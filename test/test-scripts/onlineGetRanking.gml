///onlineSetRanking(cid)
var cid = argument0;
var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "getRanking";

onlineQuery(action, cid, token, name);
