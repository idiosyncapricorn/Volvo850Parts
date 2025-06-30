// mount_arm.scad
// ——————————————————————————————————————————————————
// Connects the two brackets at a given offset, with flange on each end
// OUTPUT:  single-arm spacer between block bracket and perch bracket
// ——————————————————————————————————————————————————

/* ====== USER PARAMETERS ====== */
// vector from block‐bracket plate face to perch‐bracket plate face [X, Y, Z] (mm)
arm_offset = [0, 200, -50];    
// arm cross-section width & thickness (mm)
arm_w = 40;                    
arm_t = 5;                    

/* ====== MODULE ====== */
module mount_arm() {
  // create a rectangular tube (hollow box) of length = |arm_offset|
  l = norm(arm_offset);
  // orient along XY plane, then rotate into place
  rotate(a = [0, atan2(arm_offset[2], sqrt(arm_offset[0]*arm_offset[0] + arm_offset[1]*arm_offset[1]))*180/PI, 
                atan2(arm_offset[1], arm_offset[0])*180/PI])
  translate([0, -arm_t/2, -arm_w/2])
    difference() {
      cube([ l, arm_t, arm_w ]);
      translate([arm_t, 0, arm_t])
        cube([ l - 2*arm_t, arm_t, arm_w - 2*arm_t ]);
    }
}

/* ====== RENDER ====== */
mount_arm();
