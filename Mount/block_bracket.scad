// block_bracket.scad
// ——————————————————————————————————————————————————
// Bolts to the two lower block‐ear bosses on a Volvo B‐series
// OUTPUT:  plate with two M10 holes at the correct spacing
// ——————————————————————————————————————————————————

/* ====== USER PARAMETERS ====== */
// center‐to‐center spacing between the two block‐ear bosses [X, Y] (mm)
ear_spacing = [250, 80];      
// bolt hole diameter (clearance for M10) (mm)
ear_hole_dia = 11;             
// bracket plate thickness (mm)
plate_thk = 6;                 
// extra margin around the holes (mm)
margin     = 20;               

/* ====== DERIVED SIZES ====== */
plate_size = [
  ear_spacing[0] + margin*2,
  ear_spacing[1] + margin*2
];

/* ====== MODULE ====== */
module block_bracket() {
  difference() {
    // outer face
    cube([ plate_size[0], plate_thk, plate_size[1] ], center=false);
    // bolt holes
    for (x_off = [ margin, margin + ear_spacing[0] ])
      for (y_off = [ margin, margin + ear_spacing[1] ])
        translate([ x_off, -1, y_off ])
          cylinder(h=plate_thk+2, r=ear_hole_dia/2, $fn=48);
  }
}

/* ====== RENDER ====== */
block_bracket();
