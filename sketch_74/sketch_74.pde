float radius = 150;
int m = 3;
int n = 12;
Thing[] things = new Thing[m*n];

int numFrames = 720;
float t;
void setup() {
  size(900, 900);
  colorMode(HSB, 360, 100, 100, 255);
  
  for(int i=0;i<m*n;i++) {
    things[i] = new Thing();
  }
}

void draw() {
  t = (float)frameCount/numFrames;
  background(#080015);
  translate(width/2, height/2);

  for (int j=0; j<m; j++) {
    float x = 0;
    float y = 0;
    float r = radius;
    float angle = TAU*t;
    for (int i=0; i<n; i++) {
      push();
      scale(map(sin(3*angle), -1, 1, 0.2, 1.1));
      x += r/1.5;
      r /= 1.25;
      
      rotate(TAU*t*i + j*TAU/m);
      float xx = screenX(x, y);
      float yy = screenY(x, y);
      pop();
      
      push();
      resetMatrix();
      
      float h = j*360/m + map(i, 0, n, 100, 0);
      int index = j*n+i;
      things[index].show(xx, yy, r, (i+1)*5, h);
      pop();
    }
  }
}

class Thing {
  float rad = 50;
  float x, y;
  ArrayList<PVector> tail;
  int skip = 2;

  Thing() {
    tail = new ArrayList();
  }

  void show(float x, float y, float rad, int limit, float h) {
    this.rad = rad;
    if (tail.size() > limit) tail.remove(0);
    
    tail.add(new PVector(x, y));
    
    
    float s = 88;
    float b = 93;
    
    for (int i=0; i<tail.size()-1; i++) { 
      float r = map(i, 0, tail.size(), 0, rad);
      
      float hh = map(i, 0, limit, h-80, h);
      float a = map(i, 0, tail.size()-1, 6, 255);
      
      noStroke();
      fill(hh%360, s, b, a);
      ellipse(tail.get(i).x, tail.get(i).y, r, r);
      
      strokeWeight(r);
    }
    
    noStroke();
    ellipse(x, y, rad, rad);
  }
}
