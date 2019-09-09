///exploreNRG(*array_iso_index, *id)
var ii = array(0,0);
if (argument_count > 0){
    ii = argument[0];
}
else{
    ii = getIsoIndex(array(x,y));
}

var explorer = instance_create(ii[0]*G_CELLSIZE, ii[1]*G_CELLSIZE, object_energy_explorer);
if (argument_count > 1){
    explorer.missionID = argument[1];
}
