///audio_play_variant(soundToPlay, *maxRange, *loop);
var soundToPlay = argument[0];
var maxRange = 0.2;
//Joue une légère variante du son
var soundSign = sign(1-random(2));
var loop = false;
if (argument_count>1){
    maxRange = argument[1];
}
if (argument_count > 2){
    loop = argument[2];
}

var soundIPlayed = audio_play_sound(soundToPlay, 15, loop);
audio_sound_pitch(soundIPlayed, 1+soundSign*(random(1)*maxRange));
return soundIPlayed;
