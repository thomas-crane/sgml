///mergeStocks()

var rscs = getRessources();
object_station.scrapBonus = 0;
for (var i = 0; i < array_length_1d(rscs); i++){
    var rsc = rscs[i];
    if (isFancyMaterial(rsc)){
        addHardStock(rsc, getStock(rsc));
    }
    else{
    
        object_station.scrapBonus += getRessource(rsc, "price")*getStock(rsc);
        
    }
    remStock(rsc, getStock(rsc));
}
