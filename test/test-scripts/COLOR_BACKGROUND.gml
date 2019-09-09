var mainColor = COLOR_FOREGROUND(); 
if (argument_count > 0){
    mainColor = argument[0]
} 
var col = invertColor(mainColor);
return (merge_colour(col, c_black, 0.6));
