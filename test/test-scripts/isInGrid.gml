///isInGrid(array_xy, *cave=global.currentCave)
var pos = argument[0];
var cave = noone;
if (argument_count > 1){
    cave = argument[1];
}
else{
    cave = global.currentCave;
}
var size = getRule(RULE_SIZE, cave);

return (isClamped(pos[0], 0, size[0]-1) &&
        isClamped(pos[1], 0, size[1]-1));   
