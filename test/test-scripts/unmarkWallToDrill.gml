///unmarkWallToDrill(array_iso_index)
if (instance_exists(object_drillman)){
    var delpos = noone;
    for (var i = 0; i < ds_list_size(object_drillman.drillObjectives); i++){
        var content = ds_list_find_value(object_drillman.drillObjectives, i);
        var toSearch = argument[0];
        if (content[0] == toSearch[0] &&
            content[1] == toSearch[1]){
            
            ds_list_delete(object_drillman.drillObjectives, i);
            revertWallColor(toSearch);
            return true;
        }
    }
}
