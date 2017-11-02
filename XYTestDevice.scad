//Parameters
  //Number of technical replicates
  numReplications = 5;	
  //Cube sizes to test
  cubeSize = [0.01, 0.02, 0.03, 0.04, 0.05, 0.075, 0.1, 0.15, 0.2, 0.25, 0.5, 0.75, 1];
  //End mill diameter 
  endMillD = 0.79375;  //1/32"
  aspectRatio = 0.5;     //Aspect ratio of test cube
  stockZ = 5.556;

//Maths
  //Add 1mm to end mill diameter to space out replicates
  CubeZ = max(cubeSize)*aspectRatio;
  Spacing = endMillD + 1;
  StockX = ((max(cubeSize)+Spacing)*numReplications);
  StockZ = stockZ - CubeZ; 
  NumOfCubeSizes = len(cubeSize);
  
//uncomment to render
XYTestDevice();

//Module Definition
module XYTestDevice(){
  //Draw stock
  hull(){
    translate([0,-Spacing,0])cube([Spacing+StockX,Spacing,StockZ], center=false);
    for(i = [0 : len(cubeSize)-1]){
      let (YLocation = cubeSize[i]+i*Spacing){
	for (j = [0: numReplications-1]){
	  if (i==len(cubeSize)-1)translate([0,YLocation,0])cube([1,Spacing+cubeSize[i],StockZ], center=false);
	  translate([Spacing+(j*(cubeSize[i]+Spacing)),YLocation,0]){
	    cube([Spacing+cubeSize[i], Spacing+cubeSize[i], StockZ], center=false);
	  }
	}
      }
    }
  }

  //Make test structures 
  for(i = [0 : len(cubeSize)-1]){
    let (YLocation = cubeSize[i]+i*Spacing){
      for (j = [0: numReplications-1]){
        translate([Spacing+(j*(cubeSize[i]+Spacing)),YLocation,StockZ]){
          cube([cubeSize[i], cubeSize[i], cubeSize[i]*aspectRatio], center=false);
        }
      }
    }
  }
}
