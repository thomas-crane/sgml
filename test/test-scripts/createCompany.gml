///createCompany(*owner, *name, *funds, *quote, *color)

var name = "Default Inc.";
var funds = STARTING_FUNDS;
var quote = "Defaulting since 2018";
var owner = "local";
var version = string(object_game.releaseType)+string(object_game.versionNumber);
var color = COLOR_FOREGROUND();
var creationTime = unix_timestamp();

var memories = ds_map_logcreate();
ds_map_add_list(memories, "MIA", ds_list_create());
ds_map_add_list(memories, "KIA", ds_list_create());
var history = ds_list_create();
ds_list_add(history, createRandomCave(1));
ds_list_mark_as_map(history, ds_list_size(history)-1);
ds_map_add_list(memories, "history", history);


if (argument_count > 0){
    owner = argument[0];
}
if (argument_count > 1){
    name = argument[1];
}
if (argument_count > 2){
    money = argument[2];
}
if (argument_count > 3){
    quote = argument[3];
}
if (argument_count > 4){
    color = argument[4];
}

var cid = md5_string_utf8(quote+string(creationTime)+string(name)+owner+string(color));
    
var info = ds_map_logcreate();
ds_map_add(info, "level", 1);
ds_map_add(info, "name", name);
ds_map_add(info, "funds", funds);
ds_map_add(info, "quote", quote);
ds_map_add(info, "owner", owner);
ds_map_add(info, "cid", cid);
ds_map_add(info, "color", color);
ds_map_add(info, "version", version);
ds_map_add(info, "creationTime", creationTime);
ds_map_add_map(info, "memories", memories);

if (!object_game.offlineMode){
    onlineCreateCompany(info);
}
    
return info;
