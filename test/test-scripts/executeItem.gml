///executeItem(ITEM_)
// Executes the actions related to the press of a menu item, like "Call emmet", depending on the situation
  
var item = argument0;
var dontClearSelection = true;
switch(item){

    case ITEM_CANCEL_YARD:
        var col = onChunk(object_masterselector.selection, object_building_yard);
        var ls = instance_create(col.x, col.y, object_fx_landslide);
        ls.color = c_white;
        var loot = remYard(col);
        dontClearSelection = false;
        break;
    
    case ITEM_DESTROY_BUILDING:
        var target = object_masterselector.selectedBuilding;
        if (instance_exists(target)){
            target.destroy = true;
            target.dead = true;
        }
        break;

    case ITEM_DROP_OBJECT:
        if (emmetSelectionSize() > 0){
            for (var j = 0; j < emmetSelectionSize(); j++){
                var value = ds_list_find_value(object_masterselector.selectedEmmets, j);
                if (!is_undefined(value) && instance_exists(value)){
                    emmetDropObject(value);
                }
            }
        }
        break;
    
    case ITEM_KILL_EMMET:
        dontClearSelection = false;
        if (emmetSelectionSize() > 0){
            for (var j = 0; j < emmetSelectionSize(); j++){
                var value = ds_list_find_value(object_masterselector.selectedEmmets, j);
                if (!is_undefined(value) && instance_exists(value)){
                    value.dead = true;
                }
            }
        }
        break;
    
    case ITEM_CALL_EMMET:
        var tpPoint = object_masterselector.selectedBuilding;
        if (isOperational(tpPoint) && getTPCooldown(tpPoint) <= 0){
            refreshPathfinder();    
            callEmmet(tpPoint);   
            
        }    
        break;
        
    case ITEM_BUILD_PATHWAY:
        if (!onChunk(object_masterselector.selection, object_ground)){
            var creationZone = array(object_masterselector.selection[0]*G_CELLSIZE, object_masterselector.selection[1]*G_CELLSIZE);
            addBuilding(object_ground_pathway, creationZone, sprite_ground_yard);
            dontClearSelection = false;
        }
        break;
        
    case ITEM_CLEAR_GRAVEL:
        var col = (object_masterselector.selection);
        if (getGravel(col) != noone ){
            dontClearSelection = false;
            if (isMarkedToClear(col)){
                unmarkGravelToClear(col);
            }
            else{
                markGravelToClear(col);
            }
        }
        break;
        
    case ITEM_DRILL_WALL:
        if (hasSelection(WALL)){
            var col = object_masterselector.selection;
            if (wallExists(object_masterselector.selection)){
                dontClearSelection = false;
            
                var wallMap = getWallMap(object_masterselector.selection);
                
                if (getMaxDrillPower() >= ds_map_find_value(wallMap, "solidity")){
                    if (isMarkedToDrill(col)){
                        unmarkWallToDrill(col);
                    }
                    else{
                        markWallToDrill(col);
                    }
                }
            
            }
        }
        break;
        
    case ITEM_DYNAMITE_WALL:
        if (getDynamiteState() && hasSelection(WALL)){
            var col = object_masterselector.selection;
            dontClearSelection = false;
            if (isMarkedToDynamite(col)){
                unmarkWallToDynamite(col);
            }
            else{
                markWallToDynamite(col);
            }
        }
        break;
        
    case ITEM_POWER:
        object_masterselector.selectedBuilding.powerSwitch = !object_masterselector.selectedBuilding.powerSwitch;
        if (object_masterselector.selectedBuilding.powerSwitch){
            playSfx(sound_sfx_poweron, false, object_masterselector.selectedBuilding);
        }
        else{
            playSfx(sound_sfx_poweroff, false, object_masterselector.selectedBuilding);
        }
        refreshNRG();
        break;
        
    case ITEM_KILL_BUILDING :
        if (object_masterselector.selectedBuilding.powered){
            teleportBack(object_masterselector.selectedBuilding);
            dontClearSelection = false;
        }
        break;
                
    case ITEM_DESTROY_PATHWAY:
        dontClearSelection = false;
        var col = (onChunk(object_masterselector.selection, object_ground_pathway));
        destroyPathway(col);
        break;
}

if (!dontClearSelection){
    clearSelection();
}
