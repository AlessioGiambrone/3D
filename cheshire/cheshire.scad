r_ex=3.175/2;
in_th = 0.2;
H = 10;

// mirror side barrel
%difference(){
	cylinder(h = H,r = r_ex,$fn=100);
	translate([0,0,-0.5]) cylinder(h = H+1,r = r_ex-in_th ,$fn=100);
}

// eyepiece side barrel
difference(){
	translate([0,0,-0.5]) cylinder(h = 1,r = 2,$fn=100);
	translate([0,0,-0.7]) cylinder(h = 2,r1=0,r2 = r_ex+in_th,$fn=100);
}


// internal parts
difference(){
	difference(){
		union(){
            for (i = [0:120:300]){
                rotate([0,0,i])
                    translate([0,-0.05,0]) cube(size=([r_ex-in_th/2,0.1,10]));
            }
		}
		scale([1.3,1.3,9.7]) sphere(r=1, $fn=100);
	}
	translate([0,0,9]) cylinder(h = 2,r = 0.4,$fn=100);
}

difference(){
	difference(){
		translate([0,0,9]) cylinder(h = 1,r = 0.4,$fn=100);
		translate([0,0,8.5]) cylinder(h = 2,r=0.3,$fn=100);
	}
	union(){
		scale([1.3,1.3,9.7]) sphere(r=1, $fn=100);
		translate([0,0,9.0]) scale([1,1,3]) for (i = [0:120:300]){
                rotate([90,0,30+i]) cylinder(h = 2,r=0.32,$fn=100);
        }
	}
}
