stackInnerR = 26/2;
stackWallT = 3;

assemblyScrewR = 4/2;
assemblyScrewCenterR = stackInnerR+assemblyScrewR+0.5; // give ourselves clearance

stackOuterR = assemblyScrewCenterR+assemblyScrewR+stackWallT;



nutHeadWidth = 7;
nutHeadHeight = 3;

boltL = 20; // 20mm M4 bolts


flangeW = 10;
flangeH = 10;
flangeHoleR = 4.5/2;
flangeHoleHead = 7.6/2;
flangeHoleD = 3;

baseT = nutHeadHeight+2;

bodyH = boltL-baseT;

usbCableR = 3.75/2;



lensEndD = 15;
lensEndH = 3;
cameraEndD = 6;
cameraEndH = 2.5;

wallT = 2;

lensStackH = lensEndH+cameraEndH;
lensStackD = max(lensEndD, cameraEndD)+2*wallT;
