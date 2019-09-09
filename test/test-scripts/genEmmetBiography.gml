///genEmmetBiography()

var list = ds_map_logcreate();
ds_map_add(list, "birthplace", rrandom(PLANETS-1));
ds_map_add(list, "age",  choose(18+rrandom(32)));
ds_map_add(list, "trait",  rrandom(TRAITS-1));
    
return list;
