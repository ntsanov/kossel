$fn=64;
// Set cover hieght
cover_height=100;

thck = 1.2;
width = 12;
offset = (width - 6) / 2;

module half_cover()
union(){
    square([thck, width/2]);
    translate([thck,offset,0])
    union(){
        square([2,thck]);
        translate([2,0.3,0])
        circle(d=thck+0.5);
    }
}


linear_extrude(height = cover_height, center = true, convexity = 10, twist = 0)
union() {
    translate([0,6,0])
    mirror([0,1,0])
    half_cover();
    translate([0,-6,0])
half_cover();
}
