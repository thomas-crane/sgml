///disableNoobMarkers()

var markers = array("welcome", "exploreBlink", "firstTime", "quickstart", "emmets", "oxygen", "stock", "sell");

for (var i =0; i <array_length_1d(markers); i++){
    validateMarker(markers[i]);
}

saveMarkers();

/* check every quest */
