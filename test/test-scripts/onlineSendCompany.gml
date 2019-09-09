///onlineSendCompany(company)
var companyData = json_decode(json_encode(argument0)); // Copying the map
ds_map_logdestroy(companyData[? "memories"]);    // Destroying memories
companyData[? "memories"] = noone;            /// Removing the reference

var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "updateCompany";
var company = (json_encode(companyData))
ds_map_logdestroy(companyData);

onlineQuery(action, company, token, name); 
