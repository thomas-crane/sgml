///damageBuilding(instance_building, int_amount)
argument0.actHp -= argument1;
argument0.actHp = clamp(argument0.actHp, 0, argument0.maxHp);
floatingNumbers(sysToDisplay(array(argument0.x, argument0.y)), -round(argument1), c_red);
