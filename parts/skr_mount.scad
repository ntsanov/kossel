$fn=32;

// trapezoid size
a_l = 68.125;
b_l = 24.1;
c_l = 83.1;
d_l = 76.3;

// points
a = [0,0,0];
b = [68.125,0,0];
c = [68.125,76.3,0];
d = [44.05,76.3,0];

h = 5;
w = 7;
c_d = 0.01;

difference(){
    union(){
        hull(){
            cylinder(d=0.01, h=h, center=true);
            translate([a_l+5,0,0])
                cylinder(d=c_d, h=h, center=true);
            translate([a_l+5,d_l])
                cylinder(d=c_d, h=h, center=true);
            translate(d)
                cylinder(d=c_d, h=h, center=true);
        }
        translate([68.125,0,2.5/2])
            cylinder(d=10, h=h+2.5, center=true);
        translate([68.125,76.3,2.5/2])
            cylinder(d=10, h=h+2.5, center=true);
        rotate([0,0,60])
        // profile mount plate
        translate([c_l/2+5,-w/2,h+5/2])
            difference(){
                cube([c_l-20,w,h+5], center=true);
                rotate([90,0,0])
                translate([20,0,0])
                    cylinder(d = 3.2, h = w*2, center = true);
                rotate([90,0,0])
                translate([-20,0,0])
                    cylinder(d = 3.2, h = w*2, center = true);
            }
    }
    // corner cut
    rotate([0,0,60])
        cube([30,60, h],center=true);
    // Screw holes
    translate(b)
        cylinder(d=3.2, h=h*3, center=true);
    translate(c)
        cylinder(d=3.2, h=h*3, center=true);
    // Nut sockets
    translate([68.125,0,-h/2])
        cylinder($fn=6, d=6.3, h=5, center=true);
    translate([68.125,76.3,-h/2])
        cylinder($fn=6, d=6.3, h=5, center=true);
    /* hull(){
        translate([10,5,0])
            cylinder(d=0.01, h=h, center=true);
        translate([a_l-5,5,0])
            cylinder(d=c_d, h=h, center=true);
        translate([a_l-5,d_l-5,0])
            cylinder(d=c_d, h=h, center=true);
        translate([44.05+5,76.3-5,0])
            cylinder(d=c_d, h=h+1, center=true);
    } */
}


