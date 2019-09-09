///upgradeFX(array_display_xy)
var thisPartss = part_system_create();
var thisPartcl = part_type_create();
part_system_depth(thisPartss, HUD_DEPTH+1);
part_type_shape(thisPartcl,pt_shape_flare);            //This defines the particles shape
part_type_size(thisPartcl,1,1,0,1);                    //This is for the size
part_type_scale(thisPartcl,0.2,0.2);                       //This is for scaling
part_type_color1(thisPartcl,c_aqua);                  //This sets its colour. There are three different codes for this
part_type_alpha1(thisPartcl,1);                        //This is its alpha. There are three different codes for this
part_type_speed(thisPartcl,0.0,2,0.008,0);            //The particles speed
part_type_direction(thisPartcl,90,90,0,20);            //The direction
part_type_orientation(thisPartcl,0,0,0,0,1);           //This changes the rotation of the particle
part_type_blend(thisPartcl,1);                         //This is the blend mode, either additive or normal
part_type_life(thisPartcl,1,50);                       //this is its lifespan in steps

repeat(5){
    var xx = argument0[0] + random(G_CELLSIZE) - G_CELLSIZE/2;
    var yy = argument0[1] + random(G_CELLSIZE/2);
    part_particles_create(thisPartss, xx, yy, thisPartcl, 1);
    
}
futureDestroyFX(thisPartcl, thisPartss, 3);
