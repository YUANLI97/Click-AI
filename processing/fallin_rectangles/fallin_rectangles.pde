
void setup(){
  size(1000,1000,P3D);
  background(0);
  noStroke();
}

void draw(){
  fill(0);
  rect(0,0,width,height);
  
  for(int i=0;i<=40;i++){
     pushMatrix();
     float a=millis()/200.0;
     float x = 80.0+a-(0.01*a*a)+(i%10)*100.0;
     float y = 80.0+a+i*30.0;
     translate(x,y);
      //rotateX(PI/6.0);
     float ratio = y/1000;
     float angle = sin(millis()/2000.0 + ratio*(PI/2))*2*PI;
     rotateX(PI/2.0);
     rotateY(angle);
    fill(#3153C4,60+(i*7)%51);
    rect(0,0,100+i,100+i);
    popMatrix();
  }
  
  for(int j=0;j<=55;j++){
     pushMatrix();
     float a=millis()/180.0;
     float x = 900.0+(0.01*a*a)-(j%18)*60.0;
     float y = 20.0+a+j*30.0;
     translate(x,y);
      //rotateX(PI/6.0);
     float ratio = y/1000;
     float angle = sin(millis()/2000.0 + ratio*(PI/2))*2*PI;
     rotateX(PI/2.0);
     rotateY(angle);
    fill(#39D5B6,50+(j*10)%51);
    rect(0,0,160+j,160+j);
    popMatrix();
  }
 
  for(int j=0;j<=65;j++){
     pushMatrix();
     float a=millis()/400.0;
     float x = 900.0+(0.01*a*a)-(j%10)*70.0;
     float y = 10.0+a+j*30.0;
     translate(x,y);
      //rotateX(PI/6.0);
     float ratio = y/1000;
     float angle = sin(millis()/3000.0 + ratio*(PI/2))*2*PI;
     rotateX(PI/2.0);
     rotateY(angle);
    fill(#E1AF28,50+(j*10)%51);
    rect(0,0,130+j,130+j);
    popMatrix();
  }
}

void keyPressed(){
  if (key==ENTER){
    saveFrame("falling-######.png");
  }
}
