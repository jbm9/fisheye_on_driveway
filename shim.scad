include <stack_params.scad>;

theta = 45; // angle for finished standoffs


rotate([0,theta-180,0])
difference() {
  translate([-flangeW/2, -flangeH/2,0])
  cube([flangeH, flangeW, 100], false);
  # cylinder(100, flangeHoleD/2, flangeHoleD/2, false, $fn=20);
}
