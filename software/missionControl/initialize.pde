void initialize()
{
  size(820, 1000);  
  strokeWeight(3);
  
  
  // init geomerative and set it up
  RG.init(this); 
  RG.ignoreStyles(ignoringStyles);
  RG.setPolygonizer(RG.ADAPTATIVE);
  
  //RG.setPolygonizerAngle(PI/100);
  //RG.setPolygonizer(RG.UNIFORMLENGTH);
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerLength(20);
  // RG.setPolygonizerStep(20);
  
  
  // init ControlP5 and set it up
  cp5 = new ControlP5(this);
     
  cp5.setAutoDraw(false);
  cp5.setAutoInitialization(false);
  
  cp5.addButton("SVGselect")
     .setValue(0)
     .setPosition(710,10)
     .setSize(100,19)
     ;
     
   cp5.addButton("Print")
     .setValue(0)
     .setPosition(710,37)
     .setSize(100,19)
     ;
     
   cp5.addButton("Pause")
     .setValue(0)
     .setPosition(710,60)
     .setSize(100,19)
     ;
    
   cp5.addButton("Stop")
     .setValue(0)
     .setPosition(710,83)
     .setSize(100,19)
     ;
     
   cp5.addButton("Home")
     .setValue(0)
     .setPosition(710,310)
     .setSize(100,19)
     ;
     
   cp5.addButton("Refresh")
     .setValue(0)
     .setPosition(710,135)
     .setSize(100,19)
     ;
     
   cp5.addButton("PrintSelected")
     .setValue(0)
     .setPosition(710,160)
     .setSize(100,19)
     ;
     
   cp5.addButton("Next")
     .setValue(0)
     .setPosition(710,185)
     .setSize(100,19)
     ;
     
   cp5.addButton("Preview")
     .setValue(0)
     .setPosition(710,210)
     .setSize(100,19)
     ;
     
   cp5.addButton("Higher")
     .setValue(0)
     .setPosition(710,255)
     .setSize(100,19)
     ;
     
   cp5.addButton("Lower")
     .setValue(0)
     .setPosition(710,280)
     .setSize(100,19)
     ;
     
  cp5.draw();
}

void connect(){
 // tool = new Serial(this, "/dev/tty.usbserial-A6008kSy", 9600);
 plotter = new Serial(this, "/dev/tty.usbmodemfd1231", 9600);
 plotter.bufferUntil('\n');
 delay(500); 
}
