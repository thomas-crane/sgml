///onlineInterpretResults(json)
var map = json_decode(argument0);
if (!ds_exists(map, ds_type_map) || is_undefined(map[? "type"])){
    log("Disconnecting because of a server error : "+argument0);
    offlineSwitch(true);
}
else{
    var type = map[? "type"];
    
    switch (type){
    
        default:
        log("Server error : "+argument0);
            break;
    
        case "OK":
            break;
    
        case "communityRules":
            if (!is_undefined(map[? "data"])){
                log ('Received community rules');
                object_game.communityRules = map[? "data"];
                validateMarker("readTheRules");
            }
            break;
            
        case "banned":
            object_game.banned = true;
            log("User is banned. Switching to offline mode.");
            offlineSwitch(true);
            break;
            
        case "error":
            log("Wrong query / server error : "+argument0);
            break;
            
        case "obsoleteVersion":
            var version = object_game.releaseType+"."+string(object_game.versionNumber);
            log("Expected "+map[?'data']+" and got "+version);
            object_game.newVer = map[?'data'];
            offlineSwitch(true);
            break;
            
        case "ranking":
            if (!is_undefined(map[? "data"])){
                log ('Received ranking from server ['+map[? "data"]+']');
                object_station.ranking = map[? "data"];
            }
            break;
            
        case "marketQueue":
            if (!is_undefined(map[? "data"])){
                log ('Received marketQueue from server ['+map[? "data"]+']');
                var historyMap = json_decode(map[? "data"]);
                var history = historyMap[? "default"];
                
                historyMap[? "default"] = noone;
                ds_map_logdestroy(historyMap);
                deleteMarketQueue();
                object_market.marketQueue = history;                
            }
            break;
            
        case "marketCrew":
            if (!is_undefined(map[? "data"])){
                log ('Received marketCrew from server ['+map[? "data"]+']');
                
                var crewMap = json_decode(map[? "data"]);
                
                var crewList = crewMap[? "default"];
                crewMap[? "default"] = noone;
                ds_map_logdestroy(crewMap);
                
                deleteMarketCrew();
                regularizeCrew(crewList);
                object_market.marketCrew = crewList;
                
                var offlineEmmets = 0;
                for (var i = 0; i < ds_list_size(object_market.marketCrew); i++){
                    var cm = object_market.marketCrew[|i];
                    if (cm[?'origin'] == ORIGIN_MARKET){
                        offlineEmmets ++;
                    }
                }
                for (var i = offlineEmmets; i < OFFLINE_EMMETS; i++){
                    ds_list_add(object_market.marketCrew, genEmmet(true));
                    ds_list_mark_as_map(object_market.marketCrew,ds_list_size(object_market.marketCrew)-1);
                }
            }
            break;
            
        case "news":
            if (!is_undefined(map[? "data"])){
                log ('Received News from server ['+map[? "data"]+']');
                var newsMap = json_decode(map[? "data"]);
                var newsList = newsMap[? 'default'];
                if (!is_undefined(newsList)){
                    ds_list_destroy(object_game.euNews);
                    object_game.euNews = newsList;
                }
                newsMap[? 'default'] = noone;
                ds_map_logdestroy(newsMap);
            }
            break;
            
        case "token":
            if (!is_undefined(map[? "data"])){
                log ('Received data and token from server ['+(map[? "data"])+']');
                var identity = json_decode(map[? "data"]);
                if (!is_undefined(identity[? "nickname"]) && string_length(identity[? "nickname"]) > 0){
                    if (instance_exists(object_ui_window_rename_player)){
                        object_ui_window_rename_player.receivedToken = identity[? "token"];
                        object_ui_window_rename_player.nameContent = identity[? "nickname"];
                        if (object_station.companyLoaded){
                            object_station.company[? "owner"] = identity[? "token"];
                        }
                        object_ui_window_rename_player.waitingForNetwork = 0;
                    }
                }
                else{
                    object_ui_window_rename_player.connectionFailed = true;
                }
                ds_map_logdestroy(identity);
            }
            break;
            
        case "surroundingLeaderboard":
            if (!is_undefined(map[? "data"])){
                log ('Received surroundings from server ['+(map[? "data"])+']');
                var uselessMap = json_decode(map[? "data"]);
                var list = uselessMap[? "default"];
                uselessMap[? "default"]= noone;
                ds_map_logdestroy(uselessMap);
                
                if (instance_exists(object_ui_window_leaderboards)){
                    // Removing first player if I am first player
                    var first = list[|0];
                    if (first[?"cid"] == object_station.company[?"cid"]){
                        var following = list[|1];
                        if (following[?"cid"] == first[?"cid"]){
                            ds_list_delete(list,0);
                            ds_map_logdestroy(first);
                        }
                    }
                    for (var i = 0; i < ds_list_size(list); i++){
                        var company = list[|i];
                        if (string_length(company[? "playerAvatar"]) <= 0){
                            continue;
                        }
                        var addr = "http://"+masterAddress+company[? "playerAvatar"];
                        log("Fetching avatar from addr "+addr);
                        
                        object_online_communicator.spriteBank[? company[? "playerAvatar"]] = sprite_add(
                            addr,
                            1,
                            false,
                            false,
                            0,
                            0
                        );
                    }
                    object_ui_window_leaderboards.leaderboardList = list;
                }
                else{
                    ds_list_destroy(list);
                }
            }
            break;
    }
}
if (ds_exists(map, ds_type_map)){
    ds_map_logdestroy(map);
}
