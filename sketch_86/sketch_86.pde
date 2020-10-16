OpenSimplexNoise noise = new OpenSimplexNoise();
float noiseRadius = 2;

color c1 = #00B0FF;
color c2 = #30E33A;

int m = 60;
float r = 500;
float per = 4;

int numFrames = 360;
float t;
void setup() {
  size(1080, 1080);
}

void draw() {
  t = (float)frameCount / numFrames;
  background(0);

  translate(width/2, height/2);

  noFill();
  strokeWeight(4);
  for (int j=0; j<m; j++) {
    float fct = map(ease(map(cos(TAU*t), -1, 1, 0, 1), 2), 0, 1, 0.5, 0.9);
    float offset = j*fct*TAU/m + PI/6*(float)noise.eval(j*0.1, noiseRadius*cos(TAU*t), noiseRadius*sin(TAU*t));
    color col = lerpColor(c2, c1, (float)j/m);
    stroke(col, 75);
    beginShape();
    for (int i=-width/2; i<width/2; i++) {
      float amp = sqrt(r*r - i*i);
      
      float x = amp*sin(per*i*TAU/width + offset + 3*TAU*t);
      float y = i;
      
      vertex(x, y);
    }
    endShape();
  }
  
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}
