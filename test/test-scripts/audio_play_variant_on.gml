///audio_play_variant_on(emitter, soundToPlay, *maxRange);
var soundToPlay = argument[1];
var maxRange = 0.2;
//Joue une légère variante du son
var soundSign = sign(1-random(2));
if (argument_count>2){
    maxRange = argument[2];
}

var soundIPlayed = audio_play_sound_on(argument[0],soundToPlay, false, 15);
audio_sound_pitch(soundIPlayed, 1+soundSign*(random(1)*maxRange));

return soundIPlayed;
