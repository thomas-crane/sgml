///drawBlock(array4[x1,y1,x2,y2], array3[colors], *shadowDistance=3)
var pos = argument[0];
var colors = argument[1]
var fgColor = colors[0];
var bgColor = colors[1];
var shColor = colors[2];
var distance = 3;
if (argument_count > 2){
    distance = argument[2];
}

draw_set_color(shColor);
draw_rectangle(pos[0]+distance, pos[1]+distance, pos[2]+distance, pos[3]+distance, false);

draw_set_color(bgColor);
draw_rectangle(pos[0], pos[1], pos[2], pos[3], false);

draw_set_color(fgColor);
draw_rectangle(pos[0], pos[1], pos[2], pos[3], true);

