///genEmmetName()

var choice = rrandom(array_length_1d(object_disk.names)-1);

return string_replace_all(object_disk.names[choice], "\t", "");
