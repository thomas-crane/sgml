///bgmFade(*sound_bgm_, *fadeSpeed)

var sound = sound_bgm_void;
var fadeSpeed = 1;

if (argument_count > 0){
    sound = argument[0];
}

if (argument_count > 1){
    fadeSpeed = argument[1];
}

object_backgroundfader.nextBgm = sound
object_backgroundfader.bgmFadeSpeed = fadeSpeed;
