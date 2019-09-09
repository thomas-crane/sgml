///onlineKillCompany(cid)
var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "killCompany";
var cid = argument0;

onlineQuery(action, cid, token, name);
