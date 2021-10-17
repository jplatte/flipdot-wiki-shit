include <lasercut.scad>; 

thickness = 5;
x = 80;
y = 241*3;
z = 302; 

x2 = 40;
y2 = z;

holes = [ 
    [MID, thickness*2, 20],
    [MID, thickness*2, 20+x2/2],
    [MID, thickness*2, y/3-20],
    [MID, thickness*2, y/3-20-x2/2],
    
    [MID, thickness*2, y/3+20],
    [MID, thickness*2, y/3+20+x2/2],
    [MID, thickness*2, y/3+y/3-20],
    [MID, thickness*2, y/3+y/3-20-x2/2],
    
    [MID, thickness*2, y/3*2+20],
    [MID, thickness*2, y/3*2+20+x2/2],
    [MID, thickness*2, y/3*2+y/3-20],
    [MID, thickness*2, y/3*2+y/3-20-x2/2]
];

/*
holes3 = [ 
    for (a = [0 : 1: 3]){
        [MID, thickness*2, y/3*a+20],
        [MID, thickness*2, y/3*a+20+x2/2],
        [MID, thickness*2, y/3*a+y/3-20],
        [MID, thickness*2, y/3*a+y/3-20-x2/2],
    };
];
*/

holes2 = [ 
    [MID, x-thickness*3, 20],
    [MID, x-thickness*3, 20+x2/2],
    [MID, x-thickness*3, y/3-20],
    [MID, x-thickness*3, y/3-20-x2/2],
    
    [MID, x-thickness*3, y/3+20],
    [MID, x-thickness*3, y/3+20+x2/2],
    [MID, x-thickness*3, y/3+y/3-20],
    [MID, x-thickness*3, y/3+y/3-20-x2/2],
    
    [MID, x-thickness*3, y/3*2+20],
    [MID, x-thickness*3, y/3*2+20+x2/2],
    [MID, x-thickness*3, y/3*2+y/3-20],
    [MID, x-thickness*3, y/3*2+y/3-20-x2/2]
];

holes4 = [ 
    [MID, x-thickness*3, 20],
    [MID, x-thickness*3, 20+x2/2],
    [MID, x-thickness*3, y/3-20],
    [MID, x-thickness*3, y/3-20-x2/2],
    
    [MID, x-thickness*3, y/3+20],
    [MID, x-thickness*3, y/3+20+x2/2],
    [MID, x-thickness*3, 300+280],
    [MID, x-thickness*3, 300+280-x2/2],
    
    [MID, x-thickness*3, 600+20],
    [MID, x-thickness*3, 600+20+x2/2],
    [MID, x-thickness*3, 600+280],
    [MID, x-thickness*3, 600+280-x2/2]
];

*color("Gold",0.75) translate([200,0,0])
    lasercutoutBox(thickness = thickness,
        x=x, y=y, z=z, sides=6
        );
lasercutoutSquare(thickness=thickness, x=x, y=y,
    finger_joints=[
            [UP, 1, 4],
            [DOWN, 1, 4]
        ],
    simple_tab_holes=holes
    );
mirror([1,0,0]){
translate([-x,0,z+thickness])    
lasercutoutSquare(thickness=thickness, x=x, y=y,
    finger_joints=[
            [UP, 1, 4],
            [DOWN, 1, 4]
        ],
    simple_tab_holes=holes2
    );
};

rotate([90,0,0])
color("Blue",0.75)
mirror([1,0,0])
translate([-x,thickness,0])
lasercutoutSquare(thickness=thickness, x=x, y=z,
    finger_joints=[
            [UP, 1, 4],
            [DOWN, 1, 4]
        ]
 );


translate([0,y+thickness,thickness])
rotate([90,0,0])
color("Blue",0.75)
lasercutoutSquare(thickness=thickness, x=x, y=z,
    finger_joints=[
            [UP, 1, 4],
            [DOWN, 1, 4]
        ]
 );


for (t =[10,y/3-50,y/3+10,y/3*2-50,y/3*2+10,y-50]){
    rotate([90,0,90]){
        translate([t+thickness/2,thickness,thickness*2]){
            color("Green",0.5)
            lasercutoutSquare(thickness=thickness, x=x2, y=y2,
            simple_tabs=[
                    [UP, x2/4, y2],
                    [UP, x2/4+x2/2, y2],
                    [DOWN, x2/4, 0],
                    [DOWN, x2/4+x2/2, 0],
                ]
            );
        };
    };
};

//displays
    translate([0,thickness,thickness]){
        color("red",0.25) cube([60,y/3,z]);
        translate([0,240,0]){
            color("green",0.25) cube([60,y/3,z]);
            translate([0,240,0]){
                color("blue",0.25) cube([60,y/3,z]);
            }
        }
    }
