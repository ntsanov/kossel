$fn=64;

bed_d = 200;

clamp_l=50;
clamp_w=23  ;
clamp_h=8;

m3_d = 3.3;
m3_head_d=6+0.5;
m3_head_h=3+0.5;

// bed + insulation + glass
heatbed_tck = 5 + 3 + 3;

module lower_part(){
    difference(){
        translate([0,-clamp_l/2,0])
            cube([clamp_w,clamp_l,clamp_h]);
        translate([bed_d/2+13,0,0])
            cylinder(d=bed_d, h=heatbed_tck-1, center=true);
        for (p_y=[
            clamp_l/2-7,
            -clamp_l/2+7,
            ]){
            hull(){
                translate([5,p_y,0])
                    cylinder(d=m3_d, h=clamp_h);
                translate([15,p_y,0])
                    cylinder(d=m3_d, h=clamp_h);
            }
            hull(){
                translate([5,p_y,-clamp_h+m3_head_h])
                    cylinder(d=m3_head_d, h=clamp_h);
                translate([15,p_y,-clamp_h+m3_head_h])
                    cylinder(d=m3_head_d, h=clamp_h);
            }
        }
        for (p_y=[
            clamp_l/2-15,
            -clamp_l/2+15,
            ]){
            translate([10,p_y,0])
                cylinder(d=m3_d, h=clamp_h);
            translate([10,p_y,clamp_h-3])
                cylinder($fn=6, d=6.3, h=clamp_h);
        }
    }
}

module top_part(){
    difference(){
            translate([0,-clamp_l/2,0])
        cube([clamp_w,clamp_l,clamp_h]);
            translate([bed_d/2+13,0,0])
        cylinder(d=bed_d, h=heatbed_tck-1, center=true);
        for (p_y=[
            clamp_l/2-15,
            -clamp_l/2+15,
            ]){
            translate([10,p_y,0])
                cylinder(d=m3_d, h=clamp_h);   
            translate([10,p_y,clamp_h-m3_head_h])
                cylinder(d=m3_head_d, h=clamp_h);
        }
    }
}

    translate([-10,0,clamp_h])
    rotate([0,180,0])
top_part();
    translate([clamp_w,0,clamp_h])
    rotate([0,180,0])
lower_part();