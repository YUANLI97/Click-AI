import processing.sound.*;
SoundFile file;
FFT fft;
AudioIn in;
int lineNum = 28;
int bands = 512;
float[] spectrum = new float[bands];
PVector[] positions = new PVector[lineNum];
PVector[] velocities = new PVector[lineNum];
float noiseScale = 200;
float rad = 1.5;

void setup(){
  size(1000,1000);
  background(0);
  
  fft = new FFT(this, bands);
  in = new AudioIn(this,0);
  file = new SoundFile(this, "typing.mp3");
  file.play();
  fft.input(file);
  
  for(int i=0;i<lineNum;i++){
    velocities[i] = new PVector(0,0);
    positions[i] = new PVector(random(0,1000), random(50,950));
  }
}

void draw(){
  fft.analyze(spectrum);
  noStroke();
  smooth();
  fill(255);
  for(int i=0; i<lineNum;i++){
    ellipse(positions[i].x, positions[i].y, rad, rad);
  }
  update();
}

void update(){
  for(int i=0;i<lineNum;i++){
    float move = map(spectrum[i%512],0,1,50,200);
    float direction = noise(positions[i].x/noiseScale, positions[i].y/noiseScale)*TWO_PI;
    //velocities[i].x=sin(direction)*0.5;
    velocities[i].y=random(-0.01,0.01)*(cos(direction)*5 + move*10);
    velocities[i].x = random(0.1,0.5);
    positions[i].add(velocities[i]);
    
    if(positions[i].x>width*1.1 || positions[i].x<0){
      positions[i] = new PVector(random(0,400), random(50,950));
    }
  }
}

void keyPressed(){
  if (key==ENTER){
    saveFrame("line-######.png");
  }
}
