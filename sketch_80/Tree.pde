class Tree {
  float min = 15;
  float baseAngle;
  float angle;
  float x, y;
  float l;
  color c1, c2;
  float[] rnd = new float[10000];
  int count;

  Tree() {
    x = mouseX;
    y = mouseY;
    init();
  }
  
  Tree(float x, float y) {
    this.x = x;
    this.y = y;
    init();
  }
  
  void init() {
    for (int i=0; i<rnd.length; i++) {
      rnd[i] = random(0, 1);
    }
    baseAngle = random(PI/5, PI/4);
    l = random(80, 100);
    colorMode(HSB);
    c1 = color(random(0, 255), 255, 255);
    //c2 = color(random(0, 255), 255, 255);
    c2 = color(#FFFFFF);
    colorMode(RGB);
  }

  void show(float t) {
    angle = baseAngle+baseAngle*0.1*sin(TAU*t);
    count = 0;
    push();
    translate(x, y);
    tree(l);
    pop();
  }

  void tree(float len) {
    if (len < min) {
      return;
    } 

    float sw = map(len, 200, min, 10, 1);
    strokeWeight(sw);
    color col = lerpColor(c2, c1, (float)min/len);
    stroke(col);

    line(0, 0, 0, -len);
    translate(0, -len);
    
    
    
    float scl = map(rnd[count], 0, 1, 0.6, 0.9);

    count++;
    count = count%(rnd.length-5);
    push();
    rotate(map(rnd[count+4], 0, 1, -angle+angle*0.2, -angle-angle*0.2));
    tree(len*scl);
    pop();

    push();
    rotate(map(rnd[count+5], 0, 1, -angle*0.6, angle*0.6));
    tree(len*scl);
    pop();

    push();
    rotate(map(rnd[count+3], 0, 1, angle+angle*0.2, angle-angle*0.2));
    tree(len*scl);
    pop();
  }
  
  void setColor(float hue) {
    colorMode(HSB);
    c1 = color(hue, 255, 255);
    colorMode(RGB);
  }
}
