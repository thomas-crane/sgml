///drawBuildingLights(building_instance)

switch (argument0.object_index){
    case object_building_powerplant:
    
        if (argument0.powered){
            draw_sprite(sprite_buildinglights_powerplant, 0, drawPos[0], drawPos[1]);
        }
        break;
}
