///onlineCreateCompany(company)
var companyData = argument0;
var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "createCompany";
var company = (json_encode(companyData))

onlineQuery(action, company, token, name);
