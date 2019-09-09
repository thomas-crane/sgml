///dumpMapRecursively(ds_list, *int_depth=0)
var str = "["+string(argument[0])+"] ";
var list = argument[0];
var dpth = 0;
if (argument_count > 1){
    dpth = argument[1];
}

if (dpth > 10){
    return "[DEPTH OVER LIMIT]";
}
var size = ds_list_size(list) ;
for (var i = 0; i < size; i++;){
    var data = list[|i];
    
    str += "
";
    for (var j = 0; j < dpth; j ++){
        str += "    ";
    }
    str += "|_ ";
    
    if (is_real(data)){
        if (ds_exists(data, ds_type_list)){
            str += dumpListRecursively(data);
        }
        else if (ds_exists(data, ds_type_map)){
            str += dumpMapRecursively(data, dpth+1);
        }
    }    
    else{
        str += string(data);
    }
}

return str;
