// ====== PARAMETERS (edit these!) ======
filter_OD   = 200;          // mm: filter outer diameter (or width)
filter_height = 150;        // mm: filter height
box_wall    = 4;            // mm: wall thickness
box_gap     = 5;            // mm: clearance around filter
inlet_d     = 60;           // mm: inlet tube diameter
inlet_xy    = [20, 50];     // mm: inlet center from front-bottom-left
outlet_d    = 50;           // mm: outlet tube diameter
outlet_xyz  = [180, 100, 80]; // mm: outlet center from front-bottom-left

// ====== CALCULATED SIZES ======
box_w = filter_OD + 2*box_gap + 2*box_wall;
box_l = filter_OD + 2*box_gap + 2*box_wall;
box_h = filter_height + box_gap + box_wall;

// ====== MODULE ======
module airbox() {
  // Outer shell
  cube([box_w, box_l, box_h]);

  // Inner cavity (filter space)
  translate([box_wall, box_wall, box_wall])
    cube([box_w - 2*box_wall,
          box_l - 2*box_wall,
          box_h - box_wall]);

  // Inlet port
  translate([inlet_xy[0], inlet_xy[1], box_h/2 - inlet_d/2])
    rotate([90, 0, 0])
      cylinder(h = box_wall*2, r = inlet_d/2, $fn = 48);

  // Outlet port
  translate(outlet_xyz)
    rotate([90, 0, 0])
      cylinder(h = box_wall*2, r = outlet_d/2, $fn = 48);
}

// ====== RENDER ======
difference() {
  airbox();
}
