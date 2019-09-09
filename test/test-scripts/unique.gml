///unique()
//assures the object has only one instance
if (instance_number(object_index) > 1){
    instance_destroy();
    exit;
}
