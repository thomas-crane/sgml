///getWeight(rsc)
// How much weighs 1 unit of this resource in the stock ?
if (isBuilding(argument0)){
    return getBuilding(argument0, "size")*BUILDING_WEIGHT;
}
switch (argument0){
    default:
        return 10;  // 10 kg
        break;
}
