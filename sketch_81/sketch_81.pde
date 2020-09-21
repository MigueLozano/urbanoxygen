float goldenRatio = (1+sqrt(5))/2;
float turnFraction;

int m;
float radius;
float pow;
float offset;
int per = 4;

color c1 = #69E5FC;
color c2 = #6C02D8;

int numFrames = 1440;
float t;
void setup() {
  size(900, 900);
}

void draw() {
  t = (float)frameCount/numFrames;
  turnFraction = sqrt(goldenRatio + 0.01*cos(TAU*t));
  background(0);
  
  offset = map(mouseX, 0, width, 0, TAU);
  pow = map(sin(per*TAU*t), -1, 1, -0.5, 0.5);
  m = (int)map(sin(per*TAU*t + goldenRatio), -1, 1, 50, 1000);
  radius = map(sin(per*TAU*t), -1, 1, 0, 600);
  float size = map(radius, 0, 600, 3, 15);
  
  translate(width/2, height/2);
  
  for(int i=1;i<m;i++) {
    float dst = radius*pow((float)i/(m-1), pow);
    float angle = TAU*turnFraction*i;
    
    float x = dst*cos(angle);
    float y = dst*sin(angle);
    
    stroke(lerpColor(c2, c1, (float)i/m));
    strokeWeight(size);
    point(x, y);
  }  
}
