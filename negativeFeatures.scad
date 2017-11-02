//Parameters
  //Number of technical replicates
  numReplications = 3;	
  //Feature sizes to test in ascending order
  cubeSize = [0.05, 0.075, 0.1, 0.15, 0.2, 0.254, 0.396875, 0.79375];
  //End mill diameter 
  depth = 0.15;     //Depth of cut
  stockZ = 5.556;

//Maths
  //Add 1mm to end mill diameter to space out replicates
  Spacing = 2;
  StockX = (((2*max(cubeSize))+(2*Spacing)+(10*max(cubeSize)))*numReplications);
  StockZ = stockZ; 
  NumOfCubeSizes = len(cubeSize);
  
//uncomment to render
negativeFeaturesTestDevice();

//Module Definition
module negativeFeaturesTestDevice(){
difference(){
  //Draw stock
  hull(){
    translate([0,-Spacing,0])cube([Spacing+StockX,Spacing,StockZ], center=false);
    for(i = [0 : len(cubeSize)-1]){
    let (YLocation = 10*cubeSize[i]+i*2*Spacing){
	for (j = [0: numReplications-1]){
	  if (i==len(cubeSize)-1)translate([0,YLocation+10*cubeSize[i],0])cube([StockX+Spacing,Spacing+cubeSize[i],StockZ], center=false);
	  translate([Spacing+(j*(cubeSize[i]+Spacing)),YLocation,0]){
	    cube([Spacing+cubeSize[i], Spacing+cubeSize[i], StockZ], center=false);
	  }
	}
      }
    }
  }

  //Make test structures 
  for(i = [0 : len(cubeSize)-1]){
    let (YLocation = 10*cubeSize[i]+i*2*Spacing){
      for (j = [0: numReplications-1]){
        translate([Spacing+(j*(12*cubeSize[i]+2*Spacing)),YLocation,StockZ-depth]){
          #cube([2*cubeSize[i], 10*cubeSize[i], depth], center=false);
        }
        translate([(2*cubeSize[i]+2*Spacing)+(j*(12*cubeSize[i]+2*Spacing)),YLocation,StockZ-depth]){
	  #cube([10*cubeSize[i], 2*cubeSize[i], depth], center=false);
	}
      }
    }
  }
}
}
