///playSfx(sound_sfx_, *variant=false, *locationTarget=noone, *targetIsSysGrid=true, *audioGain=1, *loop=false)
if (argument_count > 2 && instance_exists(argument[2])){

    var sysGrid = true;    

    if (argument_count > 3){
        sysGrid = argument[3];
    }
    
    var emitto = instance_create(0,0, object_emitter);
    
    emitto.sysGrid = sysGrid;
    emitto.targetX = argument[2].x;
    emitto.targetY = argument[2].y;
    emitto.sysGrid = sysGrid;
    if (sysGrid){
        emitto.x = sysToDisplayX(argument[2].x, argument[2].y);
        emitto.y = sysToDisplayY(argument[2].x, argument[2].y);
    }
    emitto.targetID = argument[2];
    emitto.soundToPlay = argument[0];
    emitto.variant = argument[1];
    
    if (argument_count > 4){
        emitto.audioGain = argument[4]*getSetting("sfxVolume");
    }
    else{
        emitto.audioGain *= getSetting("sfxVolume");
    }
    
    emitto.soundId = -1;
    
    
    with (emitto){
        if (soundId == -1){
            if (!argument[1]){
                soundId = audio_play_sound_on(emitter, soundToPlay, false, 14);
                }
            else{
                soundId = audio_play_variant_on(emitter, soundToPlay);
                }
            audio_sound_gain(soundId, audioGain*getSetting("sfxVolume"), 0);
        }
    }
    
    return emitto.soundId;
}
else{
    var variant = false;
    var loop = false;
    if (argument_count > 1){
        variant = argument[1];
    }
    if (argument_count > 5){
        loop = argument[5];
    }
    if (variant){
        var sound = audio_play_variant(argument[0]); 
        audio_sound_gain(sound, getSetting("sfxVolume"), 0);
        return sound;
    }
    else{
        var sound =  audio_play_sound(argument[0], 15, loop); 
        audio_sound_gain(sound, getSetting("sfxVolume"), 0);
        return sound;
    }
}
