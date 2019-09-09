///translate(str_category, element)
var translation = "???";
switch (argument0){
    case "TOMBSTONE":
        switch(argument1){
            case "tombOf":
                translation = "Tombstone of";
                break;
        }
        break;
    case "BIOGRAPHY":
        switch(argument1){
            case "nativeTo":
                translation = "Native to";
                break;
                
            case "age":
                translation = "Age";
                break;
        }
        break;
    
    case "EMMET_TRAIT":
        switch(argument1){
            case TRAIT_NONE:
                translation = "Nothing in particular.";
                break;
        }
        break;
    
    case "EMMET_ORIGIN":
        switch(argument1){
            case ORIGIN_CREATOR:
                translation = "Been here since the beginning.";
                break;
                
            case ORIGIN_MARKET:
                translation = "Acquired on %s.";
                break;
        }
        break;
        
    case "EMMET_TRAINING":
        switch(argument1){
            case TRAINING_DYNAMITE:
                translation = "Explosives expert";
                break;
            case TRAINING_ENGINEER:
                translation = "Engineer";
                break;
            case TRAINING_PILOT:
                translation = "Pilot";
                break;
            case TRAINING_GEOLOG:
                translation = "Geologist";
                break;
        }    
        break;
    
    case "EMMET_BIRTHPLACE":
    
        switch(argument1){
            case BIRTHPLACE_EARTH:
                translation = "Planet Earth";
                break;
        }
        break;  
        
    case CAVE_BONUS:
        switch (argument1){
            case CAVE_BONUSES.LARGE_CAVE:
                translation = "Large cave";
                break;
            case CAVE_BONUSES.RESSOURCES_RICH:
                translation = "Ressources rich";
                break;
            case CAVE_BONUSES.NO_HARDROCK:
                translation = "Soft rock";
                break;
            case CAVE_BONUSES.CRYSTALLINE:
                translation = "Crystal minerals";
                break;
            case CAVE_BONUSES.SEALING:
                translation = "Air seal";
                break;
            case CAVE_BONUSES.WATER_PRESENCE:
                translation = "Presence of water";
                break;
        }
        break;
        
    case CAVE_MALUS:
        switch (argument1){
            case CAVE_MALUSES.POOR_SEALING:
                translation = "Air loss";
                break;
            case CAVE_MALUSES.LAVA_PRESENCE:
                translation = "Presence of lava";
                break;
            case CAVE_MALUSES.SMALL_CAVE:
                translation = "Small cave";
                break;
            case CAVE_MALUSES.MORE_HARDROCK:
                translation = "Hardened rock";
                break;
            case CAVE_MALUSES.RESIDUALS:
                translation = "Residuals of minerals";
                break;
            case CAVE_MALUSES.RESSOURCES_POOR:
                translation = "Few ressources";
                break;
            case CAVE_MALUSES.ELECTRIC_VARIATION:
                translation = "Electro-magnetic variations";
                break;
        }
        break;
    
    case BUILDING:
        switch (argument1){
            case object_building_uplinker:
                translation = "Uplinker";
                break;
            case object_building_stocker:
                translation = "Storage";
                break;
            case object_building_refinery:
                translation = "Refiner";
                break;
            case object_building_predeployed_battery:
                translation = "One-shot battery";
                break;
            case object_building_powerplant:
                translation = "Power station";
                break;
        }
        break
        
    case "POWER":
        switch (argument1){
            case 1:
                translation = "POWER OK"
                break;
                
            case 0:
                translation = "NO POWER"
                break;
                
            case -1:
                translation = "POWERED OFF"
                break;
                
            case "BATTERY":
                translation = "DRAINING"
                break;
        }
        break;
        
    case "ITEM_TIP":
        switch (argument1){
            case ITEM_CALL_EMMET:
                translation = "Teleport Emmet";
                break;
        }
        break;
        
    case "UI_TIP":
        case object_exitcave:
            translation = "Exit the cave and return to station";
            break;
        break;
        /*
    case "BUILDING_TIP":
        switch (argument1){
            default:
                translation = ;
                break;
        }
        break;
        */
    case "GENERAL_TIP":
        switch (argument1){
            case "BUILD":
                translation = "RIGHT CLICK to make#LEFT CLICK to place";
                break;
        }
        break;
        
    case "RSC":
        switch (argument1){
            case "fuel":
                translation = "Fuel";
                break;
                
            case "metal":
                translation = "Metal";
                break;
                
            case "junk":
                translation = "Junk";
                break;
                
            case "adiamond":
                translation = "Adamante";
                break;
                
            case "palladine":
                translation = "Palladine";
                break;
        }
        break;
    
    case "GENERAL_UI":
        
        switch (argument1){
            case "ok":
                translation = "OK";
                break;
                
            case "cancel":
                translation = "Cancel";
                break;
            case "connection":
                translation = "Connection";
                break;
            case "connecting":
                translation = "Connecting...";
                break;
            case "emmetsUnited":
                translation = "Emmets United";
                break;
                
            case "disconnect":
                translation = "Disconnect";
                break;
                
            case "next":
                translation = "Next"
                break;
                    
            case "back":
                translation = "Back";
                break;
                
            case "loading":
                translation = "Loading";
                break;
                
            case "notice":
                translation = "Notice";
                break;
        }
        break;
    
    case "CHOOSE_STOCK":
        switch (argument1){
            case "resource":
                translation = "Resource";
                break;
                
            case "amount":
                translation = "Amount";
                break;
                
            case "lastMarketValue":
                translation = "Last known value: ";
                break;
                
            case "removeFromStock":
                translation = "Remove from stock: ";
                break;
                
            case "currentStorage":
                translation = "Storage capacity";
                break;
                
            case "pleaseFree":
                translation = "Storage overloaded.#Please make place to continue.";
                break;
                
            case "drop":
                translation = "Drop";
                break
                
            case "scrapBonusText":
                translation = "A scrap-dealing company gave you %s in exchange for your unvaluable resources.";
                break;
        }
        break;
    
    case "EMMETSUNITED":
        switch (argument1){
            case "successfulConnection":
                translation = "Successfully connected to EmmetsUnited";
                break;
                
            case "connectingToEU":
                translation = "Connecting to Emmets United...";
                break;
                
            case "gotoMarket":
                translation = "Access the market";
                break;
                
            case "products":
                translation = "See our products";
                break;
                
            case "recruit":
                translation = "Recruit!";
                break;
                
            case "devise":
                translation = "The powercore of spatial colonization";
                break;
                
            case "browser":
                translation = "RackNet(c) metanet explorer";
                break;
                
            case "offlineNoNews":
                translation = "Could not reach the online platform.#No news could be fetched.";
                break;
            
            case "sellRes":
                translation = "Sell: ";
                break;
                
            case "buyingThisProduct":
                translation = "Buying this product will save you :"
                break;
                
            case "buyThisProduct":
                translation = "Buy"
                break;
                
            case "already":
                translation = "Already %s in stock"
                break;
                
            case "upgradeNeeds":
                translation = "Upgrading your station to level %s will make the following changes :##Storage capacity : %skg => %kg#Crew capacity : %s => %s";
                break;
        }
        break;
    
    case "STATION_WIZARD":
        switch (argument1){
            case "wizard":
                translation = "Company creation wizard";
                break;
                
            case "welcome":
                translation = "Welcome to the company creation wizard";
                break;
                
            case "companyInformation":
                translation = "Company information";
                break;
                
            case "welcomeText":
                translation = 
"So you wanna be an entrepreneur ? 
Sounds fair.

Follow those simple steps to set up your company and start your business.";
                break;
                
            case "colorCompanytext":
                translation = "Give an unique look to your company with a strong, defining color.";
                break;
                
            case "nameCompanyText":
                translation = "Please specify a name and a motto for your company";
                break;
                
            case "companyName":
                translation = "Company name";
                break;
                
            case "companyColor":
                translation = "Pick a color";
                break;
                
            case "color":
                translation = "Color";
                break;
                
            case "motto":
                translation = "Motto";
                break;
                
            case "resume":
                translation = "Details check-up";
                break;
                break;
                
            case "founder":
                translation = "Founder";
                break;
                
            case "resumeText":
                translation = "Check the informations are correct, then press OK to continue.";
                break;
                
            case "loadingTip1":
                translation = "Registering the trademark...";
                break;
                
            case "loadingTip2":
                translation = "Recruiting emmets...";
                break;
                
            case "loadingTip3":
                translation = "Getting sponsors...";
                break;
                
            case "companyCreatedSuccessfully":
                translation = "Your company is live!"
                break;
        }
        break;
        
    case "STATION_HOME":
        switch (argument1){
            case "creationDate":
                translation = "Creation date";
                break;
                
            case "crewSize":
                translation = "Crew size";
                break;
                
            case "leaderboardPosition":
                translation = "Company ranking";
                break;
                
            case "capital":
                translation = "Funds";
                break;
                
            case "connectEmmetsUnited":
                translation = "Connect Emmets United";
                break;
                
            case "manageStocks":
                translation = "Manage stocks";
                break;
                
            case "manageCrew":
                translation = "Manage crew";
                break;
                
            case "dropStation":
                translation = "Liquidate company";
                break;
                
            case "explore":
                translation = "Explore";
                break;
                
            case "back":
                translation = "Back";
                break;
                
            case "newCompany":
                translation = "Create a company";
                break;
                
            case "createCompany":
                translation = "Create company";
                break;
                
            case "createCompanyButtonNotice":
                translation = "Click the button below to launch the company creation wizard";
                break;
                
            case "dropCompanyTitle":
                translation = "Drop company";
                break;
                
            case "dropCompanyText":
                translation = 
"/!\ WARNING /!\
This will delete the existing station, crew, stocks, and liquidate the company.
This action cannot be undone.

Press OK to continue.
Press CANCEL to return.";
                break;
                
            case "stationLevel":
                translation = "Level";
                break;
            }
        break;
        
    case "MANAGE_CREW":
        switch (argument1){
            case "name":
                translation = "Name";
                break;
                
            case "health":
                translation = "Status";
                break;
                
            case "moveUp":
                translation = "Move up";
                break;
                
            case "moveDown":
                translation = "Move down";
                break;
                
            case "heal":
                translation = "Restore";
                break;
                
            case "fire":
                translation = "Dismiss";
                break;
                
            case "currentCrewsize":
                translation = "Crew capacity";
                break;
        }
        break;
        
    case "LORE":
        switch (argument1){
            case "palladine":
                translation = "This is a placeholder text that can serve multiple purposes : including, but not limited to, testing responsive UI or calibrating text-box sizes. This text is also sometimes used to check the line-warping capacity of a container.";
                break;
            }
        break;
        
    case "MAIN_MENU":
        switch(argument1){
            case MAIN_PLAY:
                translation = "Play";
                break;
            case MAIN_OPTIONS:
                translation = "Options";
                break;
            case MAIN_CREDITS:
                translation = "Credits";
                break;
            case MAIN_QUIT:
                translation = "Quit";
                break;
        }
        break;
        
    case "LOADER":
        switch(argument1){
            case "loading":
                translation = "Loading";
                break;
        }
        break;
}
return translation;
