///getDrillCapacity(emmet_id)
var drillerId = argument[0];
var drillCap = -1;

for (var i = 0; i < ds_list_size(drillerId.equipments); i++){
    var currentEquip = ds_list_find_value(drillerId.equipments, i);
    switch(currentEquip){
        case EQUIPMENT_DRILL:
            drillCap = max(drillCap, 0);
            break;
    }
}

