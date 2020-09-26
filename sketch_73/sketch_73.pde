OpenSimplexNoise noise = new OpenSimplexNoise();
float noiseRadius = 2;

int numFrames = 360;
float t;

float radius = 350;
int m = 3;
Thing[] thing = new Thing[m];

void setup() {
  size(900, 900);
  colorMode(HSB, 255);

  for (int i=0; i<m; i++) {
    thing[i] = new Thing(radius-i*0.3, 155+i*15, (i+1)*0.1);
  }
}

void draw() {
  t = ((float)frameCount/numFrames)%1;
  background(0);
  translate(width/2, height/2);
  rotate(-PI/2);

  for (int i=0; i<m; i++) {
    thing[i].show();
  }

  pop();
}
