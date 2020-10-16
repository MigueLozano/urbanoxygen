int m = 4000;
float radius = 760;
float fct;
color c1 = #F7FF29;
color c2 = #8808FA;

int numFrames = 360;
float t;
void setup() {
  size(1080, 1080);
}

void draw() {
  t = (float)frameCount/numFrames;
  background(0);
  translate(width/2, height/2);
  
  noStroke();
  for(int i=0;i<m;i++) {
    float angle = PI*sin(i*TAU/m - TAU*t)*tan(i*TAU/m - TAU*t) + PI/2;
    float r = pow(i*radius/m, 1);
    float x = r*cos(angle);
    float y = r*sin(angle);
    float size = map(i, 0, m, 1, 10);
    
    fill(lerpColor(c1, c2, map(dist(x, y, 0, 0), 0, radius*0.8, 0, 1)));
    ellipse(x, y, size, size);
    ellipse(-x, -y, size, size);
  }
}

void newColors() {
  colorMode(HSB);
  c1 = color(random(255), 255, 255);
  c2 = color(random(255), 255, 255);
  colorMode(RGB);
}

void mousePressed() {
  newColors();
}
