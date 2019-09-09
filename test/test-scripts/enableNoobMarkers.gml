///enableNoobMarkers()

var markers = array("welcome", "exploreBlink", "quickstart", "emmets", "oxygen", "stock", "sell");

for (var i =0; i <array_length_1d(markers); i++){
    validateMarker(markers[i], false);
}

saveMarkers();

/* check every quest */
