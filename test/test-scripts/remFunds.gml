///remFunds(int_money)
object_station.company[? "funds"] -= argument0;
object_station.company[? "funds"] = floor(object_station.company[? "funds"]);
addToStat("moneySpent", argument0);
// Floating numbers
if (isRoomAStation() && object_station.companyLoaded && 
    (   instance_exists(object_ui_window_eu) || 
        object_station.stationStep == STATION_MANAGE_CREW ||
        object_station.stationStep == STATION_CHOOSE_STOCK
    )
    ){
    
    var margin = 2;

    var vx = view_xview;
    var vy = view_yview;
    var w = view_wview;
    var h = view_hview;
    
    floatingNumbers(
                        array(
                            vx + w - margin - UI_RIGHT_BAND, 
                            vy + h - margin - UI_LEFT_BAND
                        ),
                        "- ₵"+numberFormat(argument0),
                        c_red,
                        true,
                        array(fa_right, fa_bottom)
                    );
}
