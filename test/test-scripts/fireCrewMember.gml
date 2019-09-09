///fireCrewMember(crewMember)
var eid = argument0[? "eid"];
var payOff = getPayOff(argument0);
remFunds(payOff);

if (object_game.offlineMode){
    argument0[? "previousOwner"] = object_station.company[? "name"];
    var copy = json_decode(json_encode(argument0));
    ds_list_add(object_market.marketCrew, copy);
    ds_list_mark_as_map(object_market.marketCrew, ds_list_size(object_market.marketCrew)-1);
}
else{
    argument0[? "previousOwner"] = object_station.company[? "cid"];
    onlineSendEmmet(json_encode(argument0));
}
deleteFromCrew(eid);
saveCrew();
