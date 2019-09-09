///updateMarketValue(highest, lowest, value)
var value = argument2;
var highest = argument0;
var lowest = argument1;

value *= 0.7+random(0.6);

if (value >= highest){
    value *= random(0.5)+0.5;
}
else if (value <= lowest){
    value *= 1+random(1);
}
value = clamp(value, lowest, highest);

return value;
