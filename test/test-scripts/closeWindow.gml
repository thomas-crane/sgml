///closeWindow(*id)
if (argument_count > 0 && argument[0] != noone){
    with (argument[0]){
        instance_destroy();
    }
}
else{
    instance_destroy();
}
