///exitStationWizard()
resetStationColor();
with (object_ui_window_stationwizard){
    with (hostWindow){
        instance_destroy();
    }
    instance_destroy();
}
