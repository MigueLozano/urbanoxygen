int m = 100;
Particle[] thing = new Particle[m];

int h = 400;

int numFrames = 360;
float t;
void setup() {
  size(900, 900);
  
  for(int i=0;i<m;i++) {
    thing[i] = new Particle(i%2 >= 0);
  }
}

void draw() {
  t = ((float)frameCount/numFrames)%1;
  background(0);
  
  translate(width/2, height);
  for(int i=0;i<m;i++) {
    thing[i].show();
  }
}

class Color {
  color c;
  Color(color c) {
    this.c = c;
  }
}

class Particle {
  ArrayList<PVector> tail = new ArrayList();
  ArrayList<Color> tailCol = new ArrayList();
  int limit = 30;
  
  float amp;
  float per;
  float offset;
  float cOff;
  boolean up;
  float radius;
  
  color c1 = color(#03BEFF);
  color c2 = color(#FF033E);
  
  Particle(boolean up) {
    this.up = up;
    amp = random(-50, 400);
    per = random(1, 2);
    offset = random(0, 1);
    cOff = random(0, PI/4);
    radius = random(5, 30);
    limit = (int)random(10, 40);
  }
  
  void show() {
    float x = amp*cos(TAU*t + offset*TAU);
    float y = -(height*(t+offset)%height);
    
    float amt = map(cos(TAU*t + TAU*offset + cOff + PI/2), -1, 1, 0, 1);
    color col = lerpColor(c1, c2, amt);
    
    tailCol.add(new Color(col));
    tail.add(new PVector(x, y));
    if(tail.size() > limit) {
      tail.remove(0);
      tailCol.remove(0);
    }
    
    noStroke();
    for(int i=0;i<tail.size();i++) {
      float r = map(i, 0, tail.size(), 0, radius);
      fill(tailCol.get(i).c, map(i, 0, tail.size(), 0, 255));
      ellipse(tail.get(i).x, tail.get(i).y, r, r);
    }
  }
}
