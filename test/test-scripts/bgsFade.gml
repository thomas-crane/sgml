///bgsFade(*sound_bgs_)

if (argument_count < 1){
    bgsFade(sound_bgs_void);
}
else{
    object_backgroundfader.nextBgs = argument[0];
}
