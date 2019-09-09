///floatingNumbers(array_display_xy, int, color, *text=false, *array_align)
var displayer = instance_create(0, 0, object_fx_floating_numbers)
if (argument_count > 3 && argument[3]){
    displayer.text = argument[1];
}
else{
    displayer.text = numberFormat(argument[1]);
}
if (argument_count > 4){
    displayer.align = argument[4];
}
displayer.color = argument[2];
displayer.startPosition = argument[0];
