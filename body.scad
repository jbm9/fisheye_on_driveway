include <stack_params.scad>;

topT = 2;

$fn=50;

translate([0,0,bodyH])
rotate([180,0,0])
difference() {

  cylinder(bodyH, stackOuterR, stackOuterR, false);
  cylinder(bodyH-topT, stackInnerR, stackInnerR, false);
  cylinder(100, lensStackD/2+0.05, lensStackD/2+0.05, false);


  // assembly screws
  translate([-assemblyScrewCenterR, 0, 0])  cylinder(100, assemblyScrewR, assemblyScrewR, false);
  translate([assemblyScrewCenterR, 0, 0])  cylinder(100, assemblyScrewR, assemblyScrewR, false);



  // USB cable port
  rotate([90,-90,0])
    linear_extrude(height=30) union() {
    translate([usbCableR, 0,0]) circle(usbCableR, $fn=20);
    translate([-1, -usbCableR,0]) square([usbCableR+1, usbCableR*2], false);
  }


}


