include <configuration.scad>;

barrel_radius = 8;
barrel_height = 30;

groove_radius = 6;
groove_height = 4.6;

fan_offset = 15;

module hotend_fan() {
  difference() {
    union() {
      translate([0, 2 - fan_offset, 0])
        cylinder(r=22, h=40, $fn=6);
      translate([0, 0, groove_height/2])
        cube([32, 22, groove_height], center=true);
    }
    // Opposite side cutaway (outgoing airflow).
    translate([0, 38, groove_height + 0.01]) rotate([0, 0, 30])
      cylinder(r=40, h=200, $fn=6);
    // Groove mount insert slot.
    translate([0, 10, 0])
      cube([2*groove_radius, 20, 20], center=true);
    // Keep printed plastic away from the hotend.
    intersection() {
      translate([0, 18, 0]) rotate([0, 0, 30])
        cylinder(r=28, h=100, center=true, $fn=36);
      translate([0, 10, barrel_height-5])
        cylinder(r1=barrel_radius-1, r2=100, h=55, $fn=36);
    }
    // Groove mount.
    cylinder(r=groove_radius, h=200, center=true, $fn=24);
    // J-Head barrel.
    translate([0, 0, groove_height + 0.02])
      cylinder(r=barrel_radius + 1, h=100, $fn=24);
    // Fan mounting surface and screws.
    translate([0, -50 - fan_offset, 0])
      cube([100, 100, 100], center=true);
    for (x = [-16, 16]) {
      for (z = [-16, 16]) {
        translate([x, -fan_offset, z+20]) rotate([90, 0, 0]) #
          cylinder(r=m3_radius, h=16, center=true, $fn=12);
      }
    }
    // Vertical inner space.
    intersection() {
      cube([22, 100, 100], center=true);
      translate([0, -12, groove_height + 2])
        cylinder(r=16, h=40, $fn=6);
    }
    // Air funnel.
    difference() {
      translate([0, -1 - fan_offset, 20]) rotate([-90, 0, 0])
        cylinder(r1=20, r2=0, h=25, $fn=36);
      cube([8, 40, 40], center=true);
    }
    for (a = [60:60:359]) {
      rotate([0, 0, a]) translate([0, 12.5, 5]) #
        cylinder(r=m3_radius, h=12, center=true, $fn=12);
    }
  }
}

module frame_4010(){
    union() {
        translate([0,35,0])
            cube([7,5,40]);
        translate([0,25,0])
            cube([7,2,40]); 
        translate([0,0,30])
            difference() {
                cube([7,40,10]);
                rotate([0,0,-30])
                    cube([7,40,10]);
                cube([5,2 ,10]);
                //translate([4,26,0])
                //    cube([3,14,10]);
            }
        difference() {
            cube([7,40,10]);
            rotate([0,0,-30])
                cube([7,40,10]);
            cube([5,2 ,10]);
            //translate([4,26,0])
            //    cube([3,14,10]);
        }
    }
}   

difference(){
     union(){
    hotend_fan();
    translate([-22,-15,0]) 
        frame_4010();
    translate([22,-15,0])
        mirror([1,0,0])
        frame_4010();
    }
    for (coords=[
        //// left side
        [-18,-12.5,2.5],
        [-18,22.5,2.5],
        [-18,22.5,37.5],
        [-18,-12.5,37.5],
        //// right side
        [18,-12.5,2.5],
        [18,22.5,2.5],
        [18,22.5,37.5],
        [18,-12.5,37.5],
    ])
    translate(coords)
    rotate([0,90,0])
    #cylinder($fn=32,d=2, h=10, center=true);
   
}

        
 
// Hotend barrel.
translate([0, 0, groove_height]) %
  cylinder(r=barrel_radius, h=barrel_height);

// 40mm fan.
//translate([0, -5 - fan_offset, 20]) % difference() {
//  cube([40, 10, 40], center=true);
//  rotate([90, 0, 0,]) cylinder(r=19, h=20, center=true);
//}