///resetStationColor()
if (object_station.companyLoaded){
    object_station.color = object_station.company[? "color"];
}
else{
    object_station.color = DEFAULT_COLOR;
}
with (object_station){
    colors = 
        array(COLOR_FOREGROUND(),
                COLOR_BACKGROUND(), 
                COLOR_SHADOW());
    hoveredColors = 
            array(COLOR_BACKGROUND(),
                    COLOR_FOREGROUND(), 
                    COLOR_SHADOW());
}
///log("Resetted station color - Colors are now "+string(COLOR_BACKGROUND())+" + "+string(COLOR_SHADOW())+" + "+string(COLOR_FOREGROUND())+"");
