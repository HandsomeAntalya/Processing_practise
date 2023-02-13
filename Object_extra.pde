MRect[] rects = new MRect[4];//change the variable to array

void setup() {
  size(640, 360);
  fill(255, 204);
  noStroke();
  rects[0] = new MRect(1, 134.0, 0.532, 0.1 * height, 10.0, 60.0);
  rects[1] = new MRect(2, 44.0, 0.166, 0.3 * height, 5.0, 50.0);
  rects[2] = new MRect(2, 58.0, 0.332, 0.4 * height, 10.0, 35.0);
  rects[3] = new MRect(1, 120.0, 0.0498, 0.9 * height, 15.0, 60.0);
}

void draw() {
  background(0);
  
  for (MRect rect : rects) {
    rect.display();
  }

  rects[0].move(mouseX - (width / 2), mouseY + (height * 0.1), 30);
  rects[1].move((mouseX + (width * 0.05)) % width, mouseY + (height * 0.025), 20);
  rects[2].move(mouseX / 4, mouseY - (height * 0.025), 40);
  rects[3].move(mouseX - (width / 2), (height - mouseY), 50);
}


/* mouse click to reduce the lines  */
void mousePressed() {         
  for (MRect rect : rects) {
    rect.update();
  }
}

class MRect {
  int w; // single bar width
  float xpos; // rect xposition
  float h; // rect height
  float ypos; // rect yposition
  float d; // single bar distance
  float t; // number of bars

  MRect(int iw, float ixp, float ih, float iyp, float id, float it) {
    w = iw;
    xpos = ixp;
    h = ih;
    ypos = iyp;
    d = id;
    t = it; 
  }

  void move(float posX, float posY, float damping) {
    float dif = ypos - posY;
    if (abs(dif) > 1) {
      ypos -= dif / damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) {
      xpos -= dif / damping;
    }
  }

/*reate a new update function within MRect that reduces the number of bars by one*/
  
  void update() {
    if (t > 0) {
      t--;
    }
  }

  void display() {
    for (int i = 0; i < t; i++) {
      rect(xpos + (i * (d + w)), ypos, w, height * h);
    }
  }
}
