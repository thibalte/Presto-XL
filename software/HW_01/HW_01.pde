import geomerative.*;
import controlP5.*;
ControlP5 cp5;
Slider2D location;
import javax.swing.*; 



void setup(){
  size(2*margin+numPrinters*numStrips*(sWidth+gap), 2*margin+sHeight);
  smooth();
    
  printers = new Printer[numPrinters];
  for (int i=0; i<printers.length; i++){
    printers[i] = new Printer(i); 
  }
  
  RG.init(this);
  shape = RG.loadShape("path2.svg");
  shape.centerIn(g);
  shape.translate(width/2,height/2);
  
  //CONTROL - GUI
  
    cp5 = new ControlP5(this);
  
     cp5.addSlider("shapeScale")
     .setPosition(10,10)
     .setRange(1,310)
     .setSize(100,10)
     .setLabel("scale")
     ;
     cp5.addSlider("poly")
     .setPosition(150,10)
     .setRange(1,100)
     .setSize(100,10)
     .setLabel("Polygons")
     ;
     location = cp5.addSlider2D("location") 
     .setPosition(10,25)
     .setSize(100,100)
     .setArrayValue(new float[] {2000, 2000})
     //.disableCrosshair()
     ;
     cp5.addBang("gcode")
     .setPosition(300, 10)
     .setSize(20, 20)
     .setTriggerEvent(Bang.RELEASE)    
     ;     
     cp5.addBang("FileLoader")
     .setPosition(150, 50)
     .setSize(10, 10)
     .setTriggerEvent(Bang.RELEASE)    
     ;
     cp5.addToggle("uniformlength")
     .setPosition(150,25)
     .setSize(10,10)
     .setLabel("Poly/Adaptative")
     ;
     
}

void draw(){

  update();
  display();

}

