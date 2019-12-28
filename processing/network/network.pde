int cols, rows;
int scl = 20;
float yoff = 0;
float noiseScale = 500;
float noiseStrength = 1;
int num = 2000;
Particle[] particles = new Particle[num];

void setup(){
  int w = 1000;
  int h = 1000;
  size(1000,1000);
  cols=50;
  rows=50;
  for (int i=0; i<num; i++) {
    PVector loc = new PVector(random(width*1.2), random(height), 2);
    float angle = random(TWO_PI);
    PVector dir = new PVector(cos(angle), sin(angle));
    float speed = random(.5, 2);
    particles[i]= new Particle(loc, dir, speed);
  }
}

void draw(){
  fill(0,30);
  rect(0,0,width,height);
  beginShape(LINES);
  stroke(255,35);
  for (int y = 0; y < cols; y++){
    vertex(0, yoff+y*scl);
    vertex(width, yoff+y*scl);
    vertex(yoff+y*scl, 0);
    vertex(yoff+y*scl,height);
  }
  endShape();
  
  for (int i=0; i<particles.length; i++) {
    particles[i].run();
  }
 
//  Filtershape filtershape = new Filtershape();
//  filtershape.displ();
  yoff+=0.5;
  if(yoff>=20){
    yoff = 0;
  }
}

void keyPressed(){
  if (key==ENTER){
    saveFrame("line-######.png");
  }
}
