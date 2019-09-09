///onlineBuyCrewMember(eid)
// Sends an emmet to the online market

var eid = argument0;
var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "buyCrewMember";

onlineQuery(action, eid, token, name);
