///getRessource(str_rsc, str_need)
var object = object_pickable;
var sprite = sprite_pickable_junk;
var color = colorSum(argument[0]);
var price = 500;
var fullSize = sprite_dummy;

switch(argument[0]){
    default:
        break;
    
    case "junk":
        price = 100;
        sprite = sprite_pickable_junk;
        object = object_pickable_junk
        break;
    
    case "metal":
        price = 750;
        sprite = sprite_pickable_metal;
        object = object_pickable_metal
        break;
    
    case "fuel":
        price = 2000;
        sprite = sprite_pickable_fuel;
        object = object_pickable_fuel
        break;
        
    case "roughJunk":
        price = 0;
        sprite = sprite_pickable_rough;
        object = object_pickable_roughJunk;
        break;
    case "roughMetal":
        price = 0;
        sprite = sprite_pickable_rough;
        object = object_pickable_roughMetal;
        break;
    case "roughFuel":
        price = 0;
        sprite = sprite_pickable_rough;
        object = object_pickable_roughFuel;
        break;
    
    
    case "adiamond":
        sprite = sprite_pickable_fancy_adiamond;
        object = object_pickable_fancy_adiamond;
        fullSize = sprite_rsc_adiamond;
        break;
    
    case "platene":
        sprite = sprite_pickable_fancy_platene;
        object = object_pickable_fancy_platene;
        fullSize = sprite_rsc_platene;
        break;
    
    case "gauld":
        sprite = sprite_pickable_fancy_gauld;
        object = object_pickable_fancy_gauld;
        fullSize = sprite_rsc_gauld;
        break;
    
    case "palladine":
        sprite = sprite_pickable_fancy_palladine;
        object = object_pickable_fancy_palladine;
        fullSize = sprite_rsc_palladine;
        break;
    
    case "kebelt":
        sprite = sprite_pickable_fancy_kebelt;
        object = object_pickable_fancy_kebelt;
        fullSize = sprite_rsc_kebelt;
        break;
    
    case "terranniuxe":
        sprite = sprite_pickable_fancy_terraniuxe;
        object = object_pickable_fancy_terraniuxe;
        fullSize = sprite_rsc_terraniuxe;
        break;
    
    case "copperine":
        sprite = sprite_pickable_fancy_copperine;
        object = object_pickable_fancy_copperine;
        fullSize = sprite_rsc_copperine;
        break;
    
    case "oxygenite":
        sprite = sprite_pickable_fancy_oxygenite;
        object = object_pickable_fancy_oxygenite;
        fullSize = sprite_rsc_oxygenite;
        break;
    
    case "silverade":
        sprite = sprite_pickable_fancy_silverade;
        object = object_pickable_fancy_silverade;
        fullSize = sprite_rsc_silverade;
        break;
    
    case "sulfur":
        sprite = sprite_pickable_fancy_sulfur;
        object = object_pickable_fancy_sulfur;
        fullSize = sprite_rsc_sulfur;
        break;
    
}

switch (argument[1]){
    default:
        return object;
        break;
        
    case "sprite":
        return sprite;
        break;
        
    case "color":
        return color;
        break;
        
    case "price":
        return price;
        break;
        
    case "fullSize":
        return fullSize;
        break;
}
