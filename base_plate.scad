include <stack_params.scad>;

couplingT = 3;



module nutslot(width, depth) {
  s3 = sqrt(3); // make life simpler below

  w2 = width/2;
  w2s3 = w2/s3;

  union() {
    linear_extrude(height=depth)
    polygon(points = [ [w2, w2s3], [0, width/s3], [-w2, w2s3], [-w2, -w2s3], [0, -width/s3], [w2, -w2s3] ]);
  }
}


$fn = 50;

difference() {
union() {
  /////////////////////////////////////////
  // Base cylinder
  cylinder(baseT, stackOuterR, stackOuterR, false);

  // Coupling cylinder
  difference() {
    cylinder(baseT+couplingT, stackInnerR, stackInnerR, false);
    cylinder(baseT+couplingT, stackInnerR-couplingT/2, stackInnerR-couplingT/2, false);
  }

  ////////////////////////////////////////
  // Right hand mounting flange
  difference() {
    translate([stackOuterR-3,-flangeH/2,0]) 
      cube([flangeW+3, flangeH, baseT], false);
    // screw hole
    translate([stackOuterR+flangeW/2, 0, 0]) 
      cylinder(baseT, flangeHoleR, flangeHoleR, false);		
    // countersink
    translate([stackOuterR+flangeW/2,0,baseT-flangeHoleD]) cylinder(flangeHoleD, flangeHoleR, flangeHoleHead, false);
  }


  ////////////////////////////////////////
  // Left hand mounting flange
  difference() {
    translate([-(stackOuterR+flangeW),-flangeH/2,0]) cube([flangeW+3, flangeH, baseT], false);
    // screw hole
    translate([-(stackOuterR+flangeW/2), 0, 0]) 
      cylinder(baseT, flangeHoleR, flangeHoleR, false);		
    // countersink
    translate([-(stackOuterR+flangeW/2),0,baseT-flangeHoleD]) cylinder(flangeHoleD, flangeHoleR, flangeHoleHead, false);
  }
}



  ////////////////////////////////////////
  // Assembly screw left

 translate([-assemblyScrewCenterR, 0, 0]) union() {
   cylinder(100, assemblyScrewR, assemblyScrewR, false);
   nutslot(nutHeadWidth, nutHeadHeight);
 }

 ////////////////////////////////////////
 // Assembly screw right
 translate([assemblyScrewCenterR, 0, 0]) cylinder(100, assemblyScrewR, assemblyScrewR, false);
 translate([assemblyScrewCenterR, 0, 0])
   nutslot(nutHeadWidth, nutHeadHeight);


}
