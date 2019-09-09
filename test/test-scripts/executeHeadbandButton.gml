///executeHeadbandButton(str_button)

switch(argument0){
    case "help":
        showHelp();
        break;
        
    case "options":
        instance_create(0,0, object_ui_window_options);
        break;
        
    case "menu":
        if (!debugParamGet("demoMode"))
            createMenu(array(MAIN_RESUME, MAIN_HELP, MAIN_OPTIONS, MAIN_GIVEUP, MAIN_QUIT));
        else
            createMenu(array(MAIN_RESUME, MAIN_HELP, MAIN_GIVEUP));
        break;
}
