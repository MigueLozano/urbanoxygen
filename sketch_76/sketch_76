int m;
float w;

int numFrames = 720;
float t;
void setup() {
  size(900, 900);
  smooth(8);
  
  rectMode(CENTER);
  colorMode(HSB, 360, 255, 255, 255);
}


void draw() {
  t = ((float)frameCount/numFrames)%1;
  background(0);
  m = 70;
  w = 800;
  
  translate(width/2, height/2);
  
  noFill();
  for(int i=0; i<m; i++) {
    push();
    float f = sin(TAU*t);
    rotate(5*i*TAU/m*f);
    w*=0.9;
    
    stroke(map(i, 0, m, 240, 600)%360, map(i, 0, m, 255, 0), 255, 75);
    strokeWeight(map(i, 0, m, 3, 0));
    rect(0, 0, w, w);
    
    pop();
  }
}
