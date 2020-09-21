ArrayList<Tree> tree = new ArrayList();

int numFrames = 480;
float t;
void setup() {
  size(900, 900);
}

void draw() {
  t = (float)frameCount/numFrames;
  background(0);

  for(int i=0;i<tree.size();i++) {
    tree.get(i).show(t);
  }
  
}

void mousePressed() {
  resetMatrix();
  if(mouseButton == LEFT) {
    tree.add(new Tree());
  } else if(tree.size() > 0) {
    tree.remove(tree.size()-1);
  }
}
