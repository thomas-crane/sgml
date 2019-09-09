///getMaxDrillPower()
var drillPower = noone;
for (var i = 0; i < instance_number(object_emmet); i++){
    var thisEmmet = instance_find(object_emmet, i);
    drillPower = max(getDrillCapacity(thisEmmet), drillPower);
}
//FOR VAR I < INSTANCE_NUMBER(VEHICLE_DRILLER) ....
//....etc

return drillPower;
