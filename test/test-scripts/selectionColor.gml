///selectionColor(*adder, *toMerge)
var adder = 0;
if (argument_count > 0){
    adder = argument[0];
}
if (argument_count > 1){
    var color = argument[1];
    color = array(colour_get_red(color), 
                    colour_get_green(color), 
                    colour_get_blue(color));
    
    return merge_colour(
    make_colour_rgb(30+adder+color[0],30+adder+color[1],30+color[2]+adder),
    make_colour_rgb(1+adder+color[0],1+adder+color[1],1+color[2]+adder),
    (cos(get_timer()/200000)+1)/2);
}
return merge_colour(
    make_colour_rgb(30+adder,30+adder,255),
    make_colour_rgb(1+adder,1+adder,255),
    (cos(get_timer()/200000)+1)/2);
