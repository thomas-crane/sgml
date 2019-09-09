///drawHumor(HUMOR_, object_target, *color=white, *alpha=1, *background=true)
var humor = argument[0];
var target = argument[1];
var color = c_white;
var alpha = 1;
var background = true;
if (argument_count > 2){
    color = argument[2];
}
if (argument_count > 3){
    alpha = argument[3];
}
if (argument_count > 4){
    background = argument[4];
}

if (instance_exists(object_mastermind)){
    ds_list_add(object_mastermind.humorList, array(humor, target, color, alpha, background));
}
