fn = 75;
screw_radius = 1.45;

// Fitting hole
module fitting_hole() {
  translate([0, 0, 4.75]) cylinder(r=4.5, h=6.5, $fn=fn);
  translate([0, 0, 10.25]) cylinder(r1=4.5, r2=5.5, h=1.1, $fn=fn);
}

// JHead hole
module jhead_hole() {
  translate([0, 0, -0.1]) cylinder(r=8.25,h=4.35, $fn=fn*1.5); 
}

// Screw holes
module screw_holes(radius1, radius2) {
  translate([10.3, -5.3, -2]) cylinder(r=radius1,h=20, $fn=fn);
  translate([9.3, 7.8, -2]) cylinder(r=radius2, h=20, $fn=fn);
  translate([-10.3, -5.3, -2]) cylinder(r=radius1,h=20, $fn=fn);
  translate([-9.3, 7.8, -2]) cylinder(r=radius2, h=20, $fn=fn);
}

// Main body
module body() {
  difference() {
    union() {
      difference() {
        cylinder(r=10, h=11.25, $fn=fn*2);
        // translate([10, -5, 5.75]) cylinder(r=5,h=5.75, $fn=fn);
        // translate([-10, -5, 5.75]) cylinder(r=5,h=5.75, $fn=fn);
      }
    
      // Rings of plastic
      hull() {
        translate([10.3, -5.3, 0]) cylinder(r=3,h=5.75, $fn=fn);
        translate([9.3, 7.8, 0]) cylinder(r=2.5, h=5.75, $fn=fn);
      }

      hull() {
        translate([-10.3, -5.3, 0]) cylinder(r=3,h=5.75, $fn=fn);
        translate([-9.3, 7.8, 0]) cylinder(r=2.5, h=5.75, $fn=fn);
      }
    
      union() {
        hull() {
          translate([-10.3, -5.3, 0]) cylinder(r=3, h=5.75, $fn=fn);
          translate([9.3, 7.8, 0]) cylinder(r=2.5, h=5.75, $fn=fn);
          translate([-9.3, 7.8, 0]) cylinder(r=2.5, h=5.75, $fn=fn);
        }
        hull() {
          translate([10.3, -5.3, 0]) cylinder(r=3,h=5.75, $fn=fn);
          translate([-9.3, 7.8, 0]) cylinder(r=2.5, h=5.75, $fn=fn);
        }
      }
    }
    translate([0, 29.1, -1]) cylinder(r=20, h=21, $fn=fn*3);
  }
}
difference() {
  body();
  jhead_hole();
  screw_holes(screw_radius, 1.45);
  fitting_hole();
}
