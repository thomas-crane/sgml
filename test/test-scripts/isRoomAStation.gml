///isRoomAStation(*room)

var thisRoom = room;

if (argument_count > 0 ){
    thisRoom = argument[0];
}

if (isDOSRoom(room)){
    return true;
}

switch thisRoom{
    default:
        return false;
        break;
        
    case station_selectcave:
    case station_main:
    case loading:
        return true;
        break;
}

