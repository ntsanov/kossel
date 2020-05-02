$fn=64;

h=7;
l=75;
w=15;
//m4 screws
m4_d=4+0.3;
m4_head_d=7+0.5;
m4_head_h=4;
// m3
m3_d=3+0.3;
m3_head_d=6+0.5;
m3_head_h=3;

//profile
ps = 20;
p_mnt_h=6;

union(){
    difference(){
        cube([l,w,h]);
            translate([12.5,w/2,0])
        cylinder(d=m4_d, h=h*2);
            translate([12.5,w/2,h-2])
        cylinder(d=m4_head_d+0.5, h=h*2);
        
            translate([62.5,w/2,h-2])
        cylinder(d=m4_head_d, h=h);
            translate([62.5,w/2,0])
        cylinder(d=m4_d, h=h*2);

        
    }
    for (coord=[[0,0,0],[40,0,0]]){
        translate(coord)
        difference(){
            cube([p_mnt_h,w,ps+h]);
                rotate([0,90,0])
                translate([-(h+ps/2),w/2,0])
            cylinder(d=m3_d, h=p_mnt_h*2+1, center=true);
                rotate([0,90,0])
                translate([-(h+ps/2),w/2,p_mnt_h-m3_head_h])
            cylinder(d=m3_head_d, h=p_mnt_h);
            
        }
    }
    
}