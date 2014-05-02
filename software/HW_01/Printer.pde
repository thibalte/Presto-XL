class Printer {
  Strip strips[];
  int id;
  
  Printer(int _id){
    id = _id;
    strips = new Strip[numStrips];
    
    for (int i=0; i<strips.length; i++){
      strips[i] = new Strip(i, id);
    }
  }
  
  void update(){
    for (int i=0; i<strips.length; i++){
      strips[i].getPaths();
    }
  }
  
  void display(){
    pushMatrix();
    translate(id*(numStrips*(sWidth+gap)), 0);
    for (int i=0; i<strips.length; i++){
      strips[i].display();
    }
    popMatrix();
  }
}
