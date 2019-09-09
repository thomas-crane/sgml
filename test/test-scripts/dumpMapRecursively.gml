///dumpMapRecursively(ds_map, *int_depth=0)
var str = "["+string(argument[0])+"] ";
var map = argument[0];
var dpth = 0;
if (argument_count > 1){
    dpth = argument[1];
}

if (dpth > 10){
    return "[DEPTH OVER LIMIT]";
}
var size = ds_map_size(map) ;
var key = ds_map_find_first(map);
for (var i = 0; i < size; i++;){
    var data = (map[? key]);
    
    str += "
";
    for (var j = 0; j < dpth; j ++){
        str += "    ";
    }
    str += "|_ ";
    
    if (is_real(data)){
        if (ds_exists(data, ds_type_list)){
            str += "["+string(data)+"] "+dumpListRecursively(data);
        }
        else if (ds_exists(data, ds_type_map)){
            str += dumpMapRecursively(data, dpth+1);
        }
    }    
    else{
        str += "["+key+"] "+string(data);
    }

    key = ds_map_find_next(map, key);
}

return str;
