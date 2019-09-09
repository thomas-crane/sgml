///getWallSolidity(array_iso_index)
if (instance_exists(object_drillman)){
    var drillSolidity = getWallMap(argument[0]);
    drillSolidity = ds_map_find_value(drillSolidity, "solidity");
    return drillSolidity;
}
return 0;
