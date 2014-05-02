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
  background(200);
  setStroke(false, 0, 1, 0);
  pushMatrix();
  translate(margin, margin);
  //center shape
  shape.centerIn(g, shapeScale, 1, 1);
  shape.translate((location.arrayValue()[0]*10) -  width/2 , (location.arrayValue()[1]*10) - height/2);
  
  if(uniformlength == true){
  RG.setPolygonizer(RG.UNIFORMLENGTH); 
  }else{
  RG.setPolygonizer(RG.ADAPTATIVE);
  }
  RG.setPolygonizerLength(poly);
  
  RG.ignoreStyles(true);
  
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
