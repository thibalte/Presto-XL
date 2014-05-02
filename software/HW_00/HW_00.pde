import geomerative.*;

void setup(){
  size(2*margin+numPrinters*numStrips*(sWidth+gap), 2*margin+sHeight);
  smooth();
    
  printers = new Printer[numPrinters];
  for (int i=0; i<printers.length; i++){
    printers[i] = new Printer(i); 
  }
  
  RG.init(this);
  RG.ignoreStyles();
  shape = RG.loadShape("path.svg");
  shape.centerIn(g);
  shape.translate(width/2,height/2);
}

void draw(){
  update();
  display();
}
