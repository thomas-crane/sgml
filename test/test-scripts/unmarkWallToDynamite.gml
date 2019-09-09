///unmarkWallToDynamite(array_iso_index)
if (instance_exists(object_drillman)){
    var delpos = noone;
    for (var i = 0; i < ds_list_size(object_drillman.dynamiteObjectives); i++){
        var content = ds_list_find_value(object_drillman.dynamiteObjectives, i);
        var toSearch = argument[0];
        if (content[0] == toSearch[0] &&
            content[1] == toSearch[1]){
                delpos = i;
                break;
        }
    }
    if (is_undefined(delpos) || delpos < 0){
        return false;
    }
    ds_list_delete(object_drillman.dynamiteObjectives, delpos);
    revertWallColor(toSearch);
}
