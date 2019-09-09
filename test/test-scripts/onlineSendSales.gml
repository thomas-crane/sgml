///onlineSendSales(ds_map_loot)
var token = object_game.player[? "token"];
var name = object_game.player[? "name"];
var action = "sendSales";
if (ds_map_size(object_market.lastSales) > 0){
    var loot = (json_encode(object_market.lastSales))
    
    onlineQuery(action, loot, token, name);
}
