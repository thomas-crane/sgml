///centerCameraOn(object_building_)

if (instance_exists(argument[0])){
    view_xview[view_current] = sysToDisplayX(argument[0].x, argument[0].y) - view_wview[view_current]/2;
    view_yview[view_current] = sysToDisplayY(argument[0].x, argument[0].y) - view_hview[view_current]/2;
}
