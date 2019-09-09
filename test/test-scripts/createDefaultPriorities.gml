///createDefaultPriorities()
var p =ds_list_create();
        
ds_list_add(p, PRIORITY_DYNAMITE);
ds_list_add(p, PRIORITY_BUILD);
ds_list_add(p, PRIORITY_DRILL);
ds_list_add(p, PRIORITY_CLEAR_GRAVEL);
ds_list_add(p, PRIORITY_GATHER);
ds_list_add(p, PRIORITY_REFINE);

return p;
