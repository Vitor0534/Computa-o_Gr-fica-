
import controlP5.*;

ControlP5 cp5;

int slider1 = 0;
int slider2 = 0;
int slider3 = 0;

void setup(){
  size(800,800);
  cp5 = new ControlP5(this);
  
  cp5.addSlider("slider1").setPosition(200,400).setRange(0,255);
  cp5.addSlider("slider2").setPosition(200,450).setRange(0,255);
  cp5.addSlider("slider3").setPosition(200,500).setRange(0,255);
}

int R,G,B;

void draw(){
  
  R=slider1;
  G=slider2;
  B=slider3;
  fill(R,G,B);
  circle(500,500,100);
  
}
