/**
 * Inheritance
 * 
 * A class can be defined using another class as a foundation. In object-oriented
 * programming terminology, one class can inherit fields and methods from another. 
 * An object that inherits from another is called a subclass, and the object it 
 * inherits from is called a superclass. A subclass extends the superclass.
 */

SpinSpots spots;
SpinArm arm;

void setup() {
  size(640, 360);
  arm = new SpinArm(width/2, height/2, 0.06); // increased speed for SpinArm from 0.01 ro 0.06
  spots = new SpinSpots(width/2, height/2, -0.04, 90.0); // increased speed for SpinSpots from -0.02 to -0.12

}

void draw() {
  background(204);
  arm.update();
  arm.display();
  spots.update();
  spots.display();
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
