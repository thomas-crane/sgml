///genGravel(*ds_map_loot)
var thisGrav = ds_map_logcreate();
ds_map_add(thisGrav, "hp", 100);

var loot = noone;

if (argument_count > 0){
    loot = argument[0];
}
else{
    loot = ds_map_logcreate();
    ds_map_add(loot, "roughJunk", rrandom(2)+1);
}

var rsc = getRessources();
for (var i = 0; i < array_length_1d(rsc); i++){
    if (is_undefined(ds_map_find_value(loot, rsc[i]))){
        ds_map_add(loot, rsc[i], 0);
    }
}

ds_map_add_map(thisGrav, "loot", loot);

return thisGrav;
