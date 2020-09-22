OpenSimplexNoise noise = new OpenSimplexNoise();
float noiseRadius = 2;

float m = 60;
float size;
float blobSize = 300;

PVector pos = new PVector(0, 0);

int numFrames = 720;
float t;
void setup() {
  size(900, 900);
  size = (float)width/m;
  textAlign(CENTER, CENTER);
}

void draw() {
  t = (float)frameCount/numFrames;
  background(0);
  
  translate(width/2, height/2);
  calculatePos();
  drawSymbols();
}

void calculatePos() {
  pos.x = map((float)noise.eval(0, noiseRadius*cos(TAU*t), noiseRadius*sin(TAU*t)), -1, 1, 0, width)-width/2;
  pos.y = map((float)noise.eval(10000, noiseRadius*cos(TAU*t), noiseRadius*sin(TAU*t)), -1, 1, 0, height)-height/2;
}

void drawSymbols() {
  textSize(size);
  noFill();
  stroke(255);
  for(float j=-m/2;j<m/2;j++) {
    for(float i=-m/2;i<m/2;i++) {
      float x = i*size;
      float y = j*size + size;
      
      float dis = dist(x, y, pos.x, pos.y);
      float col;
      
      blobSize = map((float)noise.eval(x*0.01, y*0.01, noiseRadius*cos(TAU*t), noiseRadius*sin(TAU*t)), -1, 1, 10, 400);
      
      if(dis < blobSize) {
        col = map(dis, 0, blobSize, 01, 0);
      } else {
        col = 0;
      }
      
      text(getSymbol(col), x, y);
    }
  }
}

char getSymbol(float n) {
  if(n < 0.1) {
    return ' ';
  } else if(n < 0.2) {
    return '.';
  } else if(n < 0.3) {
    return ':';
  } else if(n < 0.4) {
    return '-';
  } else if(n < 0.5) {
    return '=';
  } else if(n < 0.6) {
    return '+';
  } else if(n < 0.7) {
    return '*';
  } else if(n < 0.8) {
    return '#';
  } else if(n < 0.9) {
    return '%';
  } else {
    return '@';
  }
}
