///productionColor()

var colors = array(COLOR_SHADOW(), COLOR_FOREGROUND()); 
  

color0 = array(colour_get_red(colors[0]), 
                    colour_get_green(colors[0]), 
                    colour_get_blue(colors[0]));
                    
color1 = array(colour_get_red(colors[1]), 
                    colour_get_green(colors[1]), 
                    colour_get_blue(colors[1]));
    
var merge = merge_colour(
    make_colour_rgb(color0[0], color0[1],color0[2]),
    make_colour_rgb(color1[0], color1[1],color1[2]),
    (cos(get_timer()/200000)+1)/2);
    
return merge;


