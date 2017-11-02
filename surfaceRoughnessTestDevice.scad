//Parameters
  //Cube sizes to test
  zDepth = 0.015;
  //Stock and test piece definitions
  stockZ = 5.556;
  faceDepth = 2;      //Amount of stock to face
  stockX = 56;
  stockY = 60;
  //Spacing between depth tests
  spacing = 7; 
  testX = 3;
  testY = 6;

//uncomment to render
SurfaceRoughness();

//Module Definition
module SurfaceRoughness(){
  difference(){
    cube([stockX,stockY,stockZ-faceDepth], center=false);
    translate([(stockX/2)-(testX/2),stockY-testY,(stockZ-faceDepth-zDepth)]){
      cube([testX,testY,zDepth]);
    }
    translate([(stockX/2)-(testX/2)-7-testX,stockY-testY,(stockZ-faceDepth-zDepth)]){
      cube([testX,testY,zDepth]);
    }
    translate([(stockX/2)-(testX/2)+7+testX,stockY-testY,(stockZ-faceDepth-zDepth)]){
      cube([testX,testY,zDepth]);
    }
    translate([(stockX/2)-(testX/2),0,(stockZ-faceDepth-zDepth)]){
      cube([testX,testY,zDepth]);
    }
    translate([(stockX/2)-(testX/2)-7-testX,0,(stockZ-faceDepth-zDepth)]){
      cube([testX,testY,zDepth]);
    }
    translate([(stockX/2)-(testX/2)+7+testX,0,(stockZ-faceDepth-zDepth)]){
      cube([testX,testY,zDepth]);
    }
    translate([0,(stockY/2)-(testY/2),(stockZ-faceDepth-zDepth)]){
      cube([testY,testX,zDepth]);
    }
    translate([0,(stockY/2)-(testY/2)-7-testY,(stockZ-faceDepth-zDepth)]){
      cube([testY,testX,zDepth]);
    }
    translate([0,(stockY/2)-(testY/2)+7+testY,(stockZ-faceDepth-zDepth)]){
      cube([testY,testX,zDepth]);
    }
    translate([stockX-testY,(stockY/2)-(testY/2),(stockZ-faceDepth-zDepth)]){
      cube([testY,testX,zDepth]);
    }
    translate([stockX-testY,(stockY/2)-(testY/2)-7-testY,(stockZ-faceDepth-zDepth)]){
      cube([testY,testX,zDepth]);
    }
    translate([stockX-testY,(stockY/2)-(testY/2)+7+testY,(stockZ-faceDepth-zDepth)]){
      cube([testY,testX,zDepth]);
    }
    translate([0,stockY-4,0]){
      cube([4,4,stockZ]);
    }
  }
}
