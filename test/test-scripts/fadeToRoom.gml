///fadeToRoom(room, *speed=1)
if (!isFading()){
    if (instance_exists(object_debug) && object_debug.debug && keyboard_check(vk_space)){
        room_goto(argument[0]);
    }
    
    var fader = instance_create(0,0, object_fader);
    fader.objective = argument[0];
    if (argument_count > 1){
        fader.faderSpeed = argument[1];
    }
    return fader;
}

