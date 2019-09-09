///getStationCapacity(*level)
var level = object_station.company[? "level"];
if (argument_count > 0){
    level = argument[0];
}
return (1+(level-1)/4)*STORAGE_CAPACITY;
