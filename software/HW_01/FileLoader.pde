/**
filechooser taken from http://processinghacks.com/hacks:filechooser
@author Tom Carden
*/

void FileLoader(){
 
// set system look and feel 

selectInput("Select a SVG to process:", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {    
    shape = RG.loadShape(selection.getAbsolutePath()); 
  }
}


