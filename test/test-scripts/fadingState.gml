///fadingState()
if (instance_exists(object_fader)){
    return -(object_fader.ending*2)-1;  // -1 for closing, 1 for opening
}

return 0;
