///offScreenDirection(x,y, margin)
//Renvoie +1/-1 , +1/-1 suivant la direction à camera décal
var ox = argument[0];
var oy = argument[1];
var margin = 4;
if (argument_count > 2){
    margin = argument[2];
}

var offX = 0;
var offY = 0;

if (ox > view_wview[view_current]+view_xview[view_current]-margin){
    offX = 1; 
}
else if (ox < view_xview[view_current]+margin){
    offX = -1;
}

if (oy > view_hview[view_current]+view_yview[view_current]-margin){
    offY = 1; 
}
else if (oy < view_yview[view_current]+margin){
    offY = -1;
}

return array(offX, offY);

