/**
 * Composite Objects
 * 
 * An object can include several other objects. Creating such composite objects 
 * is a good way to use the principles of modularity and build higher levels of 
 * abstraction within a program.
 */

EggRing er1, er2;


void setup() {
  size(640, 360);
  er1 = new EggRing(width*0.45, height*0.5, 2, 120);
  er2 = new EggRing(width*0.65, height*0.8, 10, 180);
}


void draw() {
  background(0);
  er1.transmit();
  er2.transmit();
  
}

class Egg {
  float x, y; // X-coordinate, y-coordinate
  float tilt; // Left and right angle offset
  float angle; // Used to define the tilt
  float scalar; // Height of the egg
  float range;

  // Constructor
  Egg(float xpos, float ypos, float r, float s) {
    x = xpos;
    y = ypos;
    tilt = 0;
    scalar = s / 100.0;
    range = r;
  }

  
  void wobble() {
    tilt = cos(angle) / range;
    angle += 0.1;
    //print (angle + "-");
  }

  void display() {
    noStroke();
    fill(255);
    pushMatrix();
    translate(x, y);
    rotate(tilt);
    scale(scalar);
    
    //draw the egg shape
    beginShape();
    vertex(0, -100);
    bezierVertex(25, -100, 40, -65, 40, -40);
    bezierVertex(40, -15, 25, 0, 0, 0);
    bezierVertex(-25, 0, -40, -15, -40, -40);
    bezierVertex(-40, -65, -25, -100, 0, -100);
    endShape();
    
  //Draw two eyes
  fill(0);
  ellipse(10, -70, 10, 10);
  ellipse(-10, -70, 10, 10);

  // Draw a mouth
  fill(255,0,0);
  arc(0, -40, 20, 20, 0, PI);
  
  // Draw a hat
  fill(0, 204, 102); // Red hat
  rect(-25, -100, 50, 20);
  triangle(-25, -80, 25, -80, 0, -100);
  
    popMatrix();
  }
}

class EggRing {
  Egg ovoid;
  Ring circle = new Ring();
  Podium pedestal = new Podium(width/400, height*0.8, 800, 100); //podium

  EggRing(float x, float y, float t, float sp) {
    ovoid = new Egg(x, y, t, sp);
    circle.start(x, y - sp/2);
  }

  void transmit() {
    pedestal.display(); //podium
    ovoid.wobble();
    ovoid.display();
    circle.grow();
    circle.display();
    if (circle.on == false) {
      circle.on = true;
    }
  }
}

class Podium {
  float x, y;
  float w, h;
  
  Podium(float xpos, float ypos, float width, float height) {
    x = xpos;
    y = ypos;
    w = width;
    h = height;
  }
  
  void display() {
    fill(255, 204, 102); // Light yellow color
    rect(x, y, w, h);
  }
}

class Ring {
  
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the ring
  boolean on = false; // Turns the display on and off
  
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
  }
  
  void grow() {
    if (on == true) {
      diameter += 0.5;
      if (diameter > width*2) {
        diameter = 0.0;
      }
    }
  }
  
  void display() {
    if (on == true) {
      noFill();
      strokeWeight(4);
      stroke(155, 153);
      ellipse(x, y, diameter, diameter);
    }
  }
}
