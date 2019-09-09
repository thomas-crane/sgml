///gameWindowSize()
//returns game window REAL size, array(x,y)

var h = window_get_height()
var w = window_get_width()
var ratio = 1;

if (window_get_width() > window_get_height()){
    ratio = view_hview[view_current]/window_get_height();
    w = view_wview[view_current]/ratio;
}
else{
    ratio = view_wview[view_current]/window_get_width();
    h = view_wview[view_current]/ratio;
}

return array(w,h);
