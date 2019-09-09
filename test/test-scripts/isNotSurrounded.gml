///isNotSurrounded(array_iso_index, *only4=false, *visibility_check=false)
var ii = argument[0];
var o4 = false;
var visCheck = false;
if (argument_count > 1){
    o4 = argument[1];
}
if (argument_count > 2){
    visCheck = argument[2];
}
if (wallExists(array(ii[0], ii[1]+1), visCheck) &&
    wallExists(array(ii[0], ii[1]-1), visCheck) &&
    wallExists(array(ii[0]+1, ii[1]), visCheck) &&
    wallExists(array(ii[0]-1, ii[1]), visCheck) &&
    
    (o4 || (
    wallExists(array(ii[0]-1, ii[1]+1), visCheck) &&
    wallExists(array(ii[0]+1, ii[1]+1), visCheck) &&
    
    wallExists(array(ii[0]-1, ii[1]+1), visCheck) &&
    wallExists(array(ii[0]-1, ii[1]-1), visCheck)
    ))
    
    ){
    return false;
}
return true;
