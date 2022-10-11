
 outline = "main.dxf";


 
 L0 = 2.5;
 
 L1 = 2.5;
 L2 = 47;
 
 L3 = 8; 
 
 L4 = 5;
 L5 = 20;
 
 L6 = 9.5;
 L7 = 5;

 L10 = 125; 
 L11 = 125;

 L20 = 1;
 L22 = 0.5;
  
 L30 = 2;
 L30A = 53;
 
 L40 = 10;
 
 L50 = 3;
 L51 = 30;

L100 = 11;


// assembly view
assembly();

// ---- printable ----

//base();

//side();

//pinSideA();

//printPinSideB();

//handle();




module assembly() {
    
  translate([0,0,-2])
  base();
   
   color([1,0,0]) 
   translate([0,-105/2,15+42.5])
   rotate([90,0,0]) 
  side();

   color([1,0,0]) 
   translate([0,(105/2)+2.5,15+42.5])
   rotate([90,0,0]) 
  side();
    
  color([0,1,0,0.5]) 
  translate([0,0,12.5+45])
  rotate([90,0,0]) 
  pinSideA();

  color([0,0,1,0.5]) 
  translate([0,0,12.5+45])
  rotate([90,0,180]) 
  pinSideB();

  color([1,0,1]) 
  translate([-5,0,12.5+45+25])
  rotate([90,0,90]) 
  handle();
}



module base() {
    
    intersection () {
    translate([0,L10/2,0])
    rotate([90,0,0])
      linear_extrude(height=L10, convexity=5) {
       import(file=outline, layer="10", $fn=188);
     }
     
     translate([-L11/2,0,0])
     rotate([90,0,90])
        linear_extrude(height=L11, convexity=5) {
       import(file=outline, layer="11", $fn=188);
     }   
     
 }
     
 }


module handle() {
    difference() {
      linear_extrude(height=L40, convexity=5) {
       import(file=outline, layer="40", $fn=188);
     }
     
      translate([0, -0, 5])
     rotate([0,90,0])
     cylinder(h = 120, r =2.0, $fn=100, center=true);
 }
 }

module side() {
      linear_extrude(height=L0, convexity=5) {
       import(file=outline, layer="0", $fn=188);
     }
 }

module pinSideA() {
      rotate_extrude( convexity=5, $fn=248) {
       import(file=outline, layer="20", $fn=248);
     } 
 }
 
 module pinSideB() {
      rotate_extrude( convexity=5, $fn=248) {
       import(file=outline, layer="30", $fn=248);
     } 
 }
 
 module printPinSideB() {
     rotate_extrude( convexity=5, $fn=248) {
       import(file=outline, layer="30", $fn=248);
     }  
     translate([0,0,-25])
     linear_extrude(height=L30A, convexity=5) {
       import(file=outline, layer="30A", $fn=188);
     }
     
 }
 
 

 
/*
      rotate_extrude( convexity=5, $fn=248) {
       import(file=outline, layer="10", $fn=248);
     } 


     //2x dovetail
     translate([-40.64,0,L10/2])
     rotate([-90,90,-90])    
     linear_extrude(height=L20, convexity=5) {
       import(file=outline, layer="20", $fn=188);
     }
 } // end of the union
 
     
     // 3x bolt
     color([1,0,0])
  translate([0,-0.005,50])
  rotate([-90,0,0]) {
     linear_extrude(height=L30, convexity=5) {
       import(file=outline, layer="30", $fn=188);
     }
     
     translate([0,0,L30-0.006])
     linear_extrude(height=L31, convexity=5) {
       import(file=outline, layer="31", $fn=188);
     }
 }
 
  // 4x side bolt
 color([0, 1, 0])
      translate([0,0,57.005])
      linear_extrude(height=L40, convexity=5) {
       import(file=outline, layer="40", $fn=188);
     }
 
     




  translate([0,0,L0+L1])
     linear_extrude(height=L2, convexity=5) {
       import(file=outline, layer="2", $fn=188);
     }




     translate([10, -0, 25/2])
     rotate([0,90,0])
     cylinder(h = 40, r =2.0, $fn=100, center=true);

}
*/
