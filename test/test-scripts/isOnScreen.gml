///isOnScreen(x,y, *margin=0)
//Renvoie true ou false suivant si la position donnée est dans l'écran ou non
var ox = argument[0];
var oy = argument[1];
var margin = 0;
if (argument_count > 2){
    margin = argument[2];
}

if (
    ox < view_xview[view_current] -margin
    || oy < view_yview[view_current] -margin
    || ox > view_wview[view_current]+view_xview[view_current] +margin
    || oy < view_yview[view_current]-view_hview[view_current] -margin
    )
    {
    
    return false;
}
else{
    return true;
}
