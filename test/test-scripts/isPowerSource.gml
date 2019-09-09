///isPowerSource(object_building_)
if (isBattery(argument0)){
    return true;
}
switch argument0{
    case object_building_powerplant:
        return true;
        break;
}
return false;
