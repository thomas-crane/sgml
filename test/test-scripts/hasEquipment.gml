///hasEquipment(EQUIPMENT_, *id)
var equipList = noone;
if (argument_count > 1){
    equipList = argument[1].equipments;
}
else{
    equipList = equipments;
}

for (var i = 0; i < ds_list_size(equipList); i++){
    if (ds_list_find_value(equipList,i) == argument[0]){
        return true;
    }
}
return false;
