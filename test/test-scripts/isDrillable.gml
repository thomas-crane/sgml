///isDrillable(TERRAIN_WALL_)
switch (argument[0]){
    case TERRAIN_WALL_UNBREAKABLE:
    case TERRAIN_WALL_CLEAR:
    case noone:
        return false;
        break;

    default:
        return true;
        break;
}
