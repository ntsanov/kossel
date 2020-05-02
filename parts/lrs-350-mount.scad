h=7;
l=75;
w=15;
//m4 screws
m4_d=4;
m4_head_d=7;
m4_head_h=4;
difference(){
    cube([l,w,h]);
    translate([12.5,w/2,0])
    #cylinder(d=m4_d, h=h*2);
        translate([62.5,w/2,0])
    #cylinder(d=m4_d, h=h*2);
}