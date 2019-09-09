///terrain_add_tile(h,v,grid,tile_size,map_w,map_h,grid_value)

var h = argument0
var v = argument1
var grid = argument2
var size = argument3
var mw = argument4
var mh = argument5
var gval = argument6

var N = false
var NE = false
var E = false
var SE = false
var S = false
var SW = false
var W = false
var NW = false

if grid[# h,v] == gval && !is_undefined(grid[# h,v])
    {
    if grid[# h,v-1]
        N = true
    if grid[# h,v+1]
        S = true
    if grid[# h-1,v]
        W = true
    if grid[# h+1,v]
        E = true
    if grid[# h+1,v-1]
        NE = true
    if grid[# h-1,v-1]
        NW = true
    if grid[# h+1,v+1]
        SE = true
    if grid[# h-1,v+1]
        SW = true
    
    // si touche les bords de la grille
    if v = 0
        {N=true; NE=true; NW = true}
    if h = 0
        {W=true; NW=true; SW=true}
    if v=mh-1
        {S=true; SE=true; SW=true}
    if h=mw-1
        {E=true; NE=true; SE=true}
    
    // positions sur le tileset
    var xx=noone
    var yy=noone

    // recherche aux alentours
    if N*S*E*W*NE*NW*SE*SW {xx=1; yy=1}
    else if N*NE*E*SE*S*SW*W && !NW {xx=3; yy=0}
    else if N*NW*E*SE*S*SW*W && !NE {xx=4; yy=0}
    else if N*NE*E*SE*S*NW*W && !SW {xx=3; yy=1}
    else if N*NE*E*NW*S*SW*W && !SE {xx=4; yy=1}
    else if N*NE*E*S*SW*W && !(NW+SE) {xx=5; yy=0}
    else if N*S*E*W*NW*SE && !(NE+SW) {xx=5; yy=1}
    else if S*SE*SW*E*W*N && !(NE+NW) {xx=6; yy=0}
    else if N*NW*W*SW*S*E && !(NE+SE) {xx=7; yy=0}
    else if N*NE*E*SE*S*W && !(NW+SW) {xx=6; yy=1}
    else if W*NW*N*NE*E*S && !(SE+SW) {xx=7; yy=1}
    else if N*S*E*W && !(NE+NW+SE+SW) {xx=2; yy=3}
    else if N*E*S && !(W+NE+SE) {xx=0; yy=5}
    else if E*W*S && !(N+SE+SW) {xx=1; yy=5}
    else if N*W*S && !(E+NW+SW) {xx=0; yy=6}
    else if N*E*W && !(S+NE+NW) {xx=1; yy=6}
    else if S*SE*SW*E*W && !N {xx=1; yy=0}
    else if N*NW*W*SW*S && !E {xx=2; yy=1}
    else if E*NE*N*NW*W && !S {xx=1; yy=2}
    else if N*E*S*NE*SE && !W {xx=0; yy=1}
    else if S*SE*E*N*W && !(NE) {xx=5; yy=4}
    else if S*SW*E*N*W && !(NW) {xx=6; yy=4}
    else if N*NE*E*S*W && !(SE) {xx=5; yy=5}
    else if N*NW*E*S*W && !(SW) {xx=6; yy=5}
    else if S*SE*E*W && !(N+SW) {xx=5; yy=2}
    else if S*SW*W*E && !(N+SE) {xx=6; yy=2}
    else if N*NE*E*W && !(S+NW) {xx=5; yy=3}
    else if N*NW*W*E && !(S+NE) {xx=6; yy=3}
    else if S*SE*E*N && !(W+NE) {xx=2; yy=5}
    else if S*SW*W*N && !(E+NW) {xx=3; yy=5}
    else if N*NE*E*S && !(W+SE) {xx=2; yy=6}
    else if N*NW*W*S && !(E+SW) {xx=3; yy=6}
    else if S*E*SE && !(N+W) {xx=0; yy=0}
    else if W*SW*S && !(N+E) {xx=2; yy=0}
    else if N*W*NW && !(S+E) {xx=2; yy=2}
    else if N*E*NE && !(S+W) {xx=0; yy=2}
    else if N*E && !(S+W+NE) {xx=0; yy=3}
    else if S*E && !(N+W+SE) {xx=1; yy=3}
    else if S*W && !(N+E+SW) {xx=0; yy=4}
    else if N*W && !(E+S+NW) {xx=1; yy=4}
    else if N*S && !(E+W) {xx=3; yy=2}
    else if E*W && !(N+S) {xx=4; yy=2}
    else if N && !(S+E+W) {xx=3; yy=3}
    else if S && !(E+W+N) {xx=3; yy=4}
    else if E && !(W+S+N) {xx=4; yy=3}
    else if W && !(E+S+N) {xx=4; yy=4}
    else if !(E+S+N+W) {xx=2; yy=4}
    else show_debug_message("terrain_add_tile : err. drawing tile ("+string(h)+","+string(v)+")  N:"+string(N)+", S:"+string(S)+", E:"+string(E)+", W:"+string(W)+", NE:"+string(NE)+", NW:"+string(NW)+", SE:"+string(SE)+", SW:"+string(SW)+".")
    
    var drawCorrection = array(-G_CELLSIZE, -G_CELLSIZE);
    var tileSets = array(-1,-1);
    
    switch (gval){
        default:
            break;
        
        case TERRAIN_WALL_UNBREAKABLE:
            tileSets = array(tile_wall_unbreakable_low, tile_wall_unbreakable_high);
            break;
            
        case TERRAIN_WALL_DIRT:
            tileSets = array(tile_wall_low, tile_wall_high);
            break;
    }
    
    // afficher si tile trouvée
    if xx != noone && yy != noone && tileSets[0] > -1 && tileSets[1] > -1
        {
        global.terrain_walls_tiles[h*mw+v,0] = tile_add(tileSets[0],xx*size,yy*size,size,size,sysToDisplayX(h*G_CELLSIZE,v*G_CELLSIZE)+drawCorrection[0],sysToDisplayY(h*G_CELLSIZE,v*G_CELLSIZE)+drawCorrection[1],LAYER_LOW)
        global.terrain_walls_tiles[h*mw+v,1] = tile_add(tileSets[1],xx*size,yy*size,size,size,sysToDisplayX(h*G_CELLSIZE,v*G_CELLSIZE)+drawCorrection[0], sysToDisplayY(h*G_CELLSIZE,v*G_CELLSIZE)-3+drawCorrection[1],LAYER_HIGH)
        return true
        }
    }
return false
