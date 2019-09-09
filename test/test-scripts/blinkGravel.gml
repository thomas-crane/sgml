///blinkGravel(array_iso_index_gravel)
if (instance_exists(object_gravelman)){
    groundmod_set_colour(object_gravelman.gravelToBlink, c_white);
    object_gravelman.gravelToBlink = argument[0];
    object_gravelman.blink = 1;
}
