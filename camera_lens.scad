include <stack_params.scad>;

$fn = 50;


flangeDepth = 2;


difference() {
  union() {
    cylinder(lensStackH, lensStackD/2, lensStackD/2, false);
    cylinder(flangeDepth, stackInnerR, stackInnerR);
  }

  union() {
    translate([0,0,-0.5])
      cylinder(cameraEndH+1, (cameraEndD)/2, (cameraEndD)/2, false);
    translate([0,0,cameraEndH])
      cylinder(lensEndH, (lensEndD)/2, (lensEndD)/2, false);
  }
}


