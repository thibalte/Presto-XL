float rescale = 1;
float zDwell = 10;
boolean spindleState = false;

void gcode(){
  
  RPoint[][] pointPaths;
  PrintWriter gcode;
  gcode = createWriter("data/gcode.txt");  
  RG.init(this);
 /* RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(5);*/ 
  pointPaths = shape.getPointsInPaths();
  
  
  for (int b=0; b<printers.length; b++){
  
   for(int i = 0; i<pointPaths.length; i++){  
   
   
   //FIRST ROLL  
   if (pointPaths[i] != null) {
      beginShape();
      gcode.println("g0x"+Math.round(pointPaths[i][0].x*rescale)+"y"+Math.round(pointPaths[i][0].y*rescale));
      gcode.println("m3"); // SPINDLE ON;
    
      
      for(int j = 1; j<pointPaths[i].length-1; j++){
        
         if((pointPaths[i][j].x*rescale)<(margin+sWidth)+numStrips*(sWidth*b+gap*b)&&(pointPaths[i][j].x*rescale)>margin+numStrips*(sWidth*b+gap*b)){
         if((pointPaths[i][j].y*rescale)<height-margin&&(pointPaths[i][j].y*rescale)>margin){
        
             spindleState = true;
             
             if(j>1){
             
            if((pointPaths[i][j].x*rescale)>((margin+sWidth)+numStrips*(sWidth*b+gap*b))-marginInside&&(pointPaths[i][j-1].x*rescale)>((margin+sWidth)+numStrips*(sWidth*b+gap*b))+marginInside){
             
             println("Y1");
             spindleState = false;
             gcode.println("m5"); //change that 
             
            }
            
            if((pointPaths[i][j].x*rescale)<(margin+numStrips*(sWidth*b+gap*b))+marginInside&&(pointPaths[i][j-1].x*rescale)<(margin+numStrips*(sWidth*b+gap*b))-marginInside){
             
             println("Y2");
             spindleState = false;
             gcode.println("m5"); //change that
              
            }
            
             }
             
          
        stroke(0,0,255); strokeWeight(3);                
        vertex(pointPaths[i][j].x*rescale, pointPaths[i][j].y*rescale);
        ellipse(pointPaths[i][j].x*rescale, pointPaths[i][j].y*rescale, 5, 5);
        gcode.println("g0x"+(Math.round(pointPaths[i][j].x*rescale)-margin)+"y"+(Math.round(pointPaths[i][j].y*rescale)-margin));
                                       
          }       
        }
      }
      
      endShape();
      gcode.println("m5"); //SPINDLE OFF;
      spindleState = false;
      
      //SECOND ROLL
      
        beginShape();       
        gcode.println("g0x"+Math.round(pointPaths[i][0].x*rescale)+"z"+Math.round(pointPaths[i][0].y*rescale)); // Using Z move to wait for servo to move
        gcode.println("m3"); // SPINDLE ON;
    //  zDwell+=5; // increment Z move for next time
      
      
      
            for(int j = 1; j<pointPaths[i].length-1; j++){
        
         if((pointPaths[i][j].x*rescale)<(margin+sWidth+gap+sWidth)+numStrips*(sWidth*b+gap*b)&&(pointPaths[i][j].x*rescale)>margin+gap+sWidth+numStrips*(sWidth*b+gap*b)){
         if((pointPaths[i][j].y*rescale)<height-margin&&(pointPaths[i][j].y*rescale)>margin){
        
             spindleState = true;
             //---
                 if(j>0){
             
            if((pointPaths[i][j].x*rescale)>((margin+sWidth+gap+sWidth)+numStrips*(sWidth*b+gap*b))+marginInside&&(pointPaths[i][j-1].x*rescale)>((margin+sWidth+gap+sWidth)+numStrips*(sWidth*b+gap*b))+marginInside){
             
             println("Z1"); 
             spindleState = false;
             gcode.println("m5"); //change that
             
            }
            
            if(((pointPaths[i][j].x*rescale)<(margin+gap+sWidth+numStrips*(sWidth*b+gap*b))-marginInside)&&(pointPaths[i][j-1].x*rescale)<(margin+gap+sWidth+numStrips*(sWidth*b+gap*b))-marginInside){
             
             println("Z2");
             spindleState = false;
             gcode.println("m5"); //change that
              
            } 
            }
                    
        stroke(255,0,0); strokeWeight(3);                
        vertex(pointPaths[i][j].x*rescale, pointPaths[i][j].y*rescale);
        ellipse(pointPaths[i][j].x*rescale, pointPaths[i][j].y*rescale, 5, 5);
        gcode.println("g0x"+(Math.round(pointPaths[i][j].x*rescale)-margin)+"z"+(Math.round(pointPaths[i][j].y*rescale)-margin));
                                       
          }       
        }
      }
      
      endShape();
      spindleState = false;
      gcode.println("m5"); //SPINDLE OFF;
    
    }
  }
  }
   
  gcode.println("g0x0y0"); // go to origin
  gcode.println("g0x0z0"); // go to origin
  gcode.flush();
  gcode.close(); 
  println("export successful!");
  
 
  // noLoop(); // to see gcode lines
}



