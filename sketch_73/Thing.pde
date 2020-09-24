class Thing {
  float radius;
  int period = (int)random(6, 9);
  float offset = random(PI/1);
  float amp = random(0.07, 0.4);
  float h = random(150, 200);
  Thing(float radius, float h, float amp) {
    this.radius = radius;
    this.h = h;
    this.amp = amp;
  }

  void show() {
    noFill();
    strokeWeight(2);

    int m = 90;
    int n = 15;
    for (int j=0; j<n; j++) {
      beginShape();
      for (int i=0; i<=m+2; i++) {
        float angle = i*TAU/m;
        float am = 0;
        
        am = amp*sin(i*TAU/m - TAU*t)+0.1;
        if (am < 0) am = 0;

        float s = map(am, -amp+0.1, amp+0.1, 0, 320);
        stroke(h%255, s, 255, 70);

        float r = radius+am*radius*sin(j*PI/period/8 + period*angle+offset + TAU*t*3);
        float x = r*cos(angle);
        float y = r*sin(angle);
        curveVertex(x, y);
      }
      endShape(CLOSE);
    }
  }
}
