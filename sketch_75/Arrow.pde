

class Arrow {
  color c1 = #29EBFF; //cyan
  color c2 = #FFAD29; //orange
  float mw;
  PVector pos;
  PVector vel;
  float x, y;
  ArrayList<PVector> tail = new ArrayList();
  int listMax;
  
  Arrow(float x, float y, float maxW) {
    this.x = x;
    this.y = y;
    mw = maxW;
    listMax = (int)mw*2;
    pos = new PVector(x-mw/2, y-mw/2);
    vel = new PVector(1, 0);
  }
  
  void update() {
    pos.add(vel);
    
    if(pos.x == x+mw/2 && pos.y == y-mw/2) { //TOP RIGHT
      vel.x = 0;
      vel.y = 1;
    } else if(pos.x == x+mw/2 && pos.y == y+mw/2) { //BOT RIGHT
      vel.x = -1;
      vel.y = 0;
    } else if(pos.x == x-mw/2 && pos.y == y+mw/2) { //BOT LEFT
      vel.x = 0;
      vel.y = -1;
    } else if(pos.x == x-mw/2 && pos.y == y-mw/2) { //TOP LEFT
      vel.x = 1;
      vel.y = 0;
    }
    
    tail.add(new PVector(pos.x, pos.y));
    if(tail.size() > listMax) {
      tail.remove(0);
    }
  }
    
  
  void show() {
    rectMode(CENTER);
    noFill();
    stroke(60);
    //rect(x, y, mw, mw);
    
    //rect(pos.x, pos.y, 40, 40);
    color col = lerpColor(c1, c2, y/height);
    noStroke();
    fill(col);
    //float sw = map(x, 0, width, 10, 3);
    float sw = mw/3;
    for(int i=0;i<tail.size();i++) {
      rect(tail.get(i).x, tail.get(i).y, sw, sw);
    }
    
    float f = 3;
    rect(x, y, mw/f, mw/f);
  }
}
