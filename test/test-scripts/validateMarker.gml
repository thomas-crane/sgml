///validateMarker(str_marker, *value)

var key = argument[0];
var val = true;
if (argument_count > 1){
    val = argument[1];
}
object_game.markers[? key] = val;
