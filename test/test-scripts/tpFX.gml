///tpFX(array_xy, *width)
var width = 10;
if (argument_count > 1){
    width = argument[1];
}
var pos = argument[0];
var px = pos[0];
var py = pos[1];
var emit = instance_create(sysToDisplayX(px, py), sysToDisplayY(px, py), object_teleporter_fx);
    emit.width = width;
    emit.lifeSpan = 1;
    emit.particleColor = c_lime;
    emit.particleSpeed = 2;
    emit.particleAlphaDropSpeed = 10;
    emit.yCorrection = 0;

