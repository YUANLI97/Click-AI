class Particle{
  PVector loc, dir, vel;
  float speed;
  int hue = 0;
  int brightness = 50;
  int d = 1; // direction changeint
  int shadeMode = 0;
  
  Particle(PVector _loc, PVector _dir, float _speed){
    loc = _loc;
    dir = _dir;
    speed = _speed;
    hue = (int)map(loc.x,0,1000,100,180);
    brightness = (int)map(loc.y,0,1000,20,50);
  }
  
  void run(){
    colorMode(HSB,360,100,100);
    move();
    checkEdges();
    update();
  }
  
  void move(){
    float angle = noise(loc.x/noiseScale, loc.y/noiseScale, frameCount/noiseScale)*TWO_PI*noiseStrength;
    dir.x = cos(angle);
    dir.y = sin(angle);
    vel = dir.get();
    vel.mult(speed*d);
    loc.add(vel);
  }
  
  void checkEdges(){
    if(loc.x<0 || loc.x>width || loc.y<0 || loc.y>height){
      loc.x = random(width*1.2);
      loc.y = random(height);
    }
  }
  
  void update(){
    fill(hue,90,brightness);
    ellipse(loc.x, loc.y, loc.z, loc.z);

    if(shadeMode == 0){
      brightness += 1;
      if(brightness>=100){
        shadeMode = 1;
      }
    }
    else{
      brightness -= 1;
      if(brightness<=0){
        shadeMode = 0;
      }
    }
    
    hue += 1;
    if(hue>=360){
      hue = 0;
    }
  }
  
}
