//adoptBuildingBehavior(object_index)
switch(argument0){

    case object_building_uplinker:
        if (powered){
            drawGauge = true;
            gauge = 1-getTPCooldown(id)/TELEPORT_COOLDOWN;
        }
        else{
            drawGauge = false;
        }
        break;        

    case object_building_predeployed_battery:
    
        break; 
        
    case object_building_stabilizer:
        specialNeed = true;
        specialNeedFulfilled = false;
        specialNeedHumor = HUMOR_WATER;
        specialNeedColor = c_aqua;
        if (isOperational(id)){
            var surroundings = getSurroundingsIndex(ownIsoIndex, getBuilding(object_index, "size"));
            var efficiency = 0;
            for (var i = 0; i < array_length_1d(surroundings); i++){
                if (isVisible(surroundings[i]) && getType(surroundings[i]) == TYPE_WATER){
                    efficiency ++;
                }
            }
            if (efficiency > 0){
                specialNeedFulfilled = true;
                specialNeedTimer+= 1/room_speed;
                if (specialNeedTimer > 1){
                    specialNeedTimer = 0;
                    var fx = instance_create(sysToDisplayX(x, y), sysToDisplayY(x,y), object_teleporter_fx);
                    fx.width=32;
                    fx.lifeSpan=0.5;
                    object_oxygen.oxygen = min(object_oxygen.oldOxygen, object_oxygen.oxygen+STABILIZER_AMOUNT*efficiency);
                }
            }
            else{
                specialNeedTimer = 0;
            }
        }
        break;
        
    case object_building_refinery:
        if (isOperational(id)){
            drawGauge = true;
            var queue = getRefineryQueue(id);
            if (ds_list_size(queue) > 0){
                var toRefine = queue[| 0];
                gauge += (REFINERY_SPEED/room_speed);
                if (gauge >= 1){
                    ds_list_delete(queue, 0);
                    var map = ds_map_logcreate();
                    map[? toRefine] = 1;
                    map = makeRefined(map);
                    dropRsc(map, id);
                    ds_map_logdestroy(map);
                    if (toRefine == "roughFuel"){
                        playSfx(sound_sfx_material_glass_drop, true, id);
                    }
                    else{
                        playSfx(sound_sfx_material_heavy_drop, false, id);
                    }
                    gauge = 0;
                    
                    addToStat("materialsRefined", 1);
                }
            }
            else{
                drawGauge = false;
                gauge = 0;
            }
        }
        break;
}
