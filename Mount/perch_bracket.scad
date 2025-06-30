// perch_bracket.scad
// ——————————————————————————————————————————————————
// Welds to the BMW E21 subframe rails, captures the mount arm
// OUTPUT:  plate with two M8 holes at the chosen spacing
// ——————————————————————————————————————————————————

/* ====== USER PARAMETERS ====== */
// center‐to‐center spacing of the factory E21 subframe perches [X, Y] (mm)
perch_spacing = [300, 100];     
// bolt hole diameter (clearance for M8) (mm)
perch_hole_dia = 9;             
// perch plate thickness (mm)
perch_thk     = 6;              
// extra margin around holes (mm)
perch_margin  = 20;             

/* ====== DERIVED SIZES ====== */
perch_size = [
  perch_spacing[0] + perch_margin*2,
  perch_spacing[1] + perch_margin*2
];

/* ====== MODULE ====== */
module perch_bracket() {
  difference() {
    // subframe‐side plate
    cube([ perch_size[0], perch_thk, perch_size[1] ], center=false);
    // bolt holes
    for (x_off = [ perch_margin, perch_margin + perch_spacing[0] ])
      for (y_off = [ perch_margin, perch_margin + perch_spacing[1] ])
        translate([ x_off, -1, y_off ])
          cylinder(h=perch_thk+2, r=perch_hole_dia/2, $fn=48);
  }
}

/* ====== RENDER ====== */
perch_bracket();
