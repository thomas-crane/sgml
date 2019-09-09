///offlineSwitch(true/false)
if (!object_game.offlineMode && argument[0]){
    object_game.offlineMode = true;
    initializeMarket(object_market.marketHistory);
}
else if (!argument[0]){
    object_game.offlineMode = false;
    onlineGetMarket(10)
    onlineGetMarketCrew()
} 
