///drawShadowedText(x, y, text, *array3_colors, *w)
var colors = array(COLOR_FOREGROUND(),
                        COLOR_BACKGROUND(), 
                        COLOR_SHADOW());
var w = noone;
if (argument_count > 3){
    colors = argument[3];
}
if (argument_count>4){
    w = argument[4];
}
/*
argument[0] = floor(argument[0]);
argument[1] = floor(argument[1]);
*/
if (w == noone){
    draw_set_color(colors[2]);
    draw_text(argument[0]+1, argument[1]+1, argument[2]);
    
    draw_set_color(colors[0]);
    draw_text(argument[0], argument[1], argument[2]);
}
else{
    draw_set_color(colors[2]);
    draw_text_ext(argument[0]+1, argument[1]+1, argument[2], -1, w);
    
    draw_set_color(colors[0]);
    draw_text_ext(argument[0], argument[1], argument[2], -1, w);
}
