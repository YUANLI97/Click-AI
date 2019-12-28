class Filtershape{
  float x1 = random(0,1000);
  float y1 = random(0,1000);
  float rad = random(10,60);
  float dist = random(0,5);
  int scl = (int)random(0,5);
  
  void displ(){
    ellipseMode(CORNER);
    fill(255);
    for(int i=0;i<=scl;i++){
      for(int j=0;j<=scl;j++){
        ellipse(x1+i*(rad+dist+dist),y1+j*(rad+dist+dist),rad,rad);
      }
    }
  }
}
