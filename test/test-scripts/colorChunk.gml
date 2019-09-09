///colorChunk(array_iso_index, color, alpha);

if (instance_exists(object_gridman)){
    ds_list_add(object_gridman.chunkList, argument[0]);
    ds_list_add(object_gridman.chunkColorList, argument[1]);
    ds_list_add(object_gridman.chunkAlphaList, argument[2]);
}
