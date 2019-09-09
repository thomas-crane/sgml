///clampSelect(array_index_xy, array_grid_size)
var ci = argument[0];
var gs = argument[1];

var fin = array(
    clamp(ci[0], 0, gs[0]-1),
    clamp(ci[1], 0, gs[1]-1)
)

return fin;
