SpinSpots spots;
SpinArm arm;
StaticRect rect;
Bounce box;

void setup() {
  size(640, 360);
  arm = new SpinArm(width/2, height/2, 0.06); // increased speed for SpinArm from 0.01 to 0.06
  spots = new SpinSpots(width/2, height/2, -0.04, 90.0); // increased speed for SpinSpots from -0.02 to -0.12
  rect = new StaticRect(width/2, height/2, 0.05, 50); // added instantiation of the StaticRect class
  box = new Bounce(width/2, height/2, 50, 50); // added instantiation of the Bounce class
}

void draw() {
  background(204);
  arm.update();
  arm.display();
  spots.update();
  spots.display();
  rect.update();
  rect.display();
  box.update();
  box.display();
}

class Spin {
  float x, y, speed;
  float angle = 0.0;
  Spin(float xpos, float ypos, float s) {
    x = xpos;
    y = ypos;
    speed = s;
  }
  void update() {
    angle += speed;
    speed *= 0.99; // decrease speed gradually; modify the update method in the Spin superclass
  }
}

class SpinArm extends Spin {
  SpinArm(float x, float y, float s) {
    super(x, y, s*10); //increase the speed of both the spin arm and spin spots 
  }
  void display() {
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(x, y);
    angle += speed;
    rotate(angle);
    line(0, 0, 165, 0);
    popMatrix();
  }
}

class SpinSpots extends Spin {
  float dim;
  SpinSpots(float x, float y, float s, float d) {
    super(x, y, s);
    dim = d;
  }
  void display() {
    noStroke();
    pushMatrix();
    translate(x, y);
    angle += speed;
    rotate(angle);
    ellipse(-dim/2, 0, dim, dim);
    ellipse(dim/2, 0, dim, dim);
    popMatrix();
  }
}

class StaticRect extends Spin {
  float size;
  StaticRect(float x, float y, float s, float sz) {
    super(x, y, s);
    size = sz;
  }
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255, 0, angle % 255); // change color based on angle
    rectMode(CENTER);
    popMatrix();
  }
}

class Bounce {
  float x, y, vx, vy, ax, ay, w, h;
  Bounce(float xpos, float ypos, float width, float height) {
    x = xpos;
    y = ypos;
    w = width;
    h = height;
    vx = 0;
    vy = 0;
    ax = 0;
    ay = 0.1;
  }
  void update() {
    vx += ax;
    vy += ay;
    x += vx;
    y += vy;
    if (x < 0 || x > width - w) {
      vx *= -1;
      x = constrain(x, 0, width - w);
    }
    if (y < 0 || y > height - h) {
      vy *= -1;
      y = constrain(y, 0, height - h);
    }
  }
  void display() {
    rect(x, y, w, h);
  }
}
