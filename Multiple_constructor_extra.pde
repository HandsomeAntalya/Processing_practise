class Spot {
  float x, y, radius;
  boolean filled;
  
  // First version of the Spot constructor;
  // the fields are assigned default values
  Spot() {
    radius = 40;
    x = width*0.25;
    y = height*0.5;
    filled = false;
  }
  
  // Second version of the Spot constructor;
  // the fields are assigned with parameters;
  // a Boolean determining whether the circle is filled
  Spot(float xpos, float ypos, float r, boolean fill) {
    x = xpos;
    y = ypos;
    radius = r;
    filled = fill;
  }
  void display() {
    if (filled) {
      fill(255,153,204); //fill it with light pink
    } else {
      noFill();
    }
    ellipse(x, y, radius*2, radius*2);
  }
}

Spot sp1, sp2;

void setup() {
  size(640, 360);
  background(600); // use a dark color instead of 204 to see the difference;
  // Loop the sketch
  loop(); // comment out the noloop()
  // Run the constructor without parameters
  sp1 = new Spot();
  // Run the constructor with three parameters
  sp2 = new Spot(width*0.5, height*0.5, 120, false);
}

void draw() {
  background(200); //Add background(200) into draw loop to clear background each frame.
  sp1.display();
  sp2.display();
}
/* a mouse press function to change the x, y and radius of sp2 with every mouse click */
void mousePressed() {
  float xpos = random(0, width);
  float ypos = random(0, height);
  float r = random(20, 120);
  boolean fill = random(1) < 0.5 ? true : false; 
  // ? : to assign a boolean value to the fill variable.
  /* 0.5 represents a 50-50 chance */
  sp2 = new Spot(xpos, ypos, r, fill);
}
