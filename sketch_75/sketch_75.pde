int m = 13;
float w;

Arrow[] arrows = new Arrow[m*m];

int numFrames = 600;
void setup() {
  size(900, 900);
  w = (width-50)/m;
  
  strokeCap(SQUARE);
  
  for(int j=0;j<m;j++) {
    for(int i=0;i<m;i++) {
      int index = j*m+i;
      float x = i*w+w/2+25;
      float y = j*w+w/2+25;
      float mw = map(x, 0, width, 0.5*w, 0.1*w);
      arrows[index] = new Arrow(x, y, (int)mw);
    }
  }
}

void draw() {
  background(0);
  
  for(int i=0;i<m*m;i++) {
    arrows[i].update();
    arrows[i].show();
  }
}
