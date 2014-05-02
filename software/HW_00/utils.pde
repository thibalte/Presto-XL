void setStroke(boolean _fill, int _fColor, int _sWeight, int _sColor){
   if (_fill){
     fill(_fColor);
   } else {
     noFill();
   }
   strokeWeight(_sWeight);
   stroke(_sColor);
}

void update(){
  for (int i=0; i<printers.length; i++){
    printers[i].update();
  } 
}

void display(){
  background(255);
  setStroke(false, 0, 1, 0);
  pushMatrix();
  translate(margin, margin);
  for (int i=0; i<printers.length; i++){
    printers[i].display();
  } 
  popMatrix();
  
  for (int i=0; i<printers.length; i++){
    for (int j=0; j<printers[i].strips.length; j++){
      RG.shape(printers[i].strips[j].paths);
    }
  } 
}
