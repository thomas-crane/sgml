///invertColor(color)
var tint = color_get_hue(argument0);
var sat = colour_get_saturation(argument0);
var value = colour_get_value(argument0);
return make_colour_hsv(tint-128, sat, value);
