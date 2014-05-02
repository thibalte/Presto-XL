class Strip {
  int id;
  RShape container;
  RShape paths;
  
  Strip(int _id, int _printerId){
    id = _id;
     container = RShape.createRectangle((float)margin+_printerId*(numStrips*(sWidth+gap))+id*(sWidth+gap),(float)margin, (float)sWidth, (float)sHeight);
  }
  
  void getPaths(){
    paths = RG.intersection( shape, container ); 
  }
  
  void display(){
    pushMatrix();
    translate(id*(sWidth+gap), 0);
    rect(0, 0, sWidth, sHeight);
    popMatrix();
  }
}
