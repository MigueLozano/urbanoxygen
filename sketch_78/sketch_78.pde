int m = 500;
Particle[] thing = new Particle[m];

int numFrames = 360;
float t;
void setup() {
  size(900, 900);
  
  for(int i=0;i<m;i++) {
    thing[i] = new Particle();
  }
  background(0);
}

void draw() {
  t = ((float)frameCount/numFrames)%1;
  background(0);
  
  translate(width/2, height/2);
  
  noStroke();
  for(int i=0;i<m;i++) {
    fill(255);
    thing[i].show();
  }

}

class Particle {
  color c1 = color(#00E8FF);
  color c2 = color(#E8136C);
  
  ArrayList<PVector> tail = new ArrayList();
  int limit = 5;
  float angle;
  float size;
  float radius;
  float amp;
  float angleOffset;
  int per;
  float ampOffset;
  color col;
  
  Particle() {
    angleOffset = random(0, TAU);
    amp = random(10, 100);
    size = random(5, 25);
    per = (int)random(2, 4);
    ampOffset = random(0, TAU);
    col = lerpColor(c1, c2, random(0, 1));
  }
  
  void show() {
    radius = map(sin(3*TAU*t+angleOffset), -1, 1, 200, 320) + amp*cos(per*TAU*t + ampOffset);
    float x = radius*cos(TAU*t + angleOffset);
    float y = radius*sin(TAU*t + angleOffset);
    
    tail.add(new PVector(x, y));
    if(tail.size() > limit) {
      tail.remove(0);
    }
    
    for(int i=0;i<tail.size();i++) {
      float r = map(i, 0, tail.size(), 0, size);
      fill(lerpColor(col, 0, map(i, 0, tail.size(), 1, 0)));
      ellipse(tail.get(i).x, tail.get(i).y, r, r);
    }
  }
}
