///hasBuilding(object_building_not_instance, *powerCheck=true)

var powerCheck = true;

if (argument_count >1){
    powerCheck = argument[1];
}
var building = argument[0];
if (!is_array(building)){
    building = array(building);
}
for (var h = 0; h < array_length_1d(building); h++){
    var thisBuilding = building[h];
    for (var i = 0; i < instance_number(thisBuilding); i++){
        var thisBuild = instance_find(thisBuilding, i);
        if (isOperational(thisBuild, powerCheck)){
            return true;
        }
    }
}
return false;
