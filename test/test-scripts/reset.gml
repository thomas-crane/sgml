///reset()

with (all){
    instance_destroy(); //destroying everything
}

for (var i = 0; i < 999999; i++){ //clearing all ds lists/grids/maps, the hard way
    if (ds_exists(i, ds_type_map)){
        ds_map_logdestroy(i);
    }
    else if (ds_exists(i, ds_type_grid)){
        ds_grid_destroy(i);
    }
    else if (ds_exists(i, ds_type_list)){
        ds_list_destroy(i);
    }
}

room_goto(room_reset); //resetting the game


