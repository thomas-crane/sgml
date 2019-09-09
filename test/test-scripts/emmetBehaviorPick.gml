///emmetBehaviorPick(object_pickable)
var toPick = argument[0];
if (instance_exists(toPick)){
    for (var j = 0; j < instance_number(toPick) ; j ++){
        willDo = instance_nth_nearest(x,y, toPick, j+1);
        var anypath = path_add();
        with (object_emmet){
            if (willDo == other.willDo && id != other.id){
                other.willDo = noone;
            }
        }
        if (instance_exists(willDo) && !willDo.pickedUp && willDo.partOfBuilding == noone && canGo(array(willDo.x, willDo.y))){
            willType = WILL_PICK;
            break;
        }
    }                            
}
