///notAGameRoom(room)
if (isDOSRoom(room)){
    return true;
}
switch(argument[0]){
    default:
        return false;
        break;
    
    case menu:
    case loading:
    case station_main:
    case station_selectcave:
        return true;
        break;
}
