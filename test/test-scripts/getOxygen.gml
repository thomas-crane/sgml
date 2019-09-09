///getOxygen(*%?)
if (instance_exists(object_oxygen)){
    if (argument_count>0){
        if (argument[0]){
            return floor(100*(object_oxygen.oxygen/object_oxygen.oxygenMax));
        }
    }
    return object_oxygen.oxygen;
}
