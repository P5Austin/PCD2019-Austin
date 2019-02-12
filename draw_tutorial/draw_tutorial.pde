/* 
 Super simple draw app tutorial. Digital dinner napkin.
 Created by R.A. Robertson for @P5Austin Processing-Austin meetup group, 2014.05.07.
 Updated 2019.02.06 for PCD2019 Austin Node.
 */

void setup() {
  //size(600, 600);
  fullScreen();
  smooth();
  background(255);
  //  strokeWeight(10);            // Use this to set a consistent line thickness. *
  //  strokeCap(SQUARE);           // Change line terminus here (ROUND (default), SQUARE, PROJECT).
}

void draw() {
  if (mousePressed) {
    //ellipse(mouseX, mouseY, 30, 30);  // Most basic kind of paintbrush. Remove and improve...
    stroke(0, 155);                 // Play with alpha value for watercolor effect.
    strokeWeight(10 / dist(mouseX, mouseY, pmouseX, pmouseY));  // * Or use something like this.
    line(mouseX, mouseY, pmouseX, pmouseY);                     // Main business draw tool.
    //line(mouseX, mouseY, pmouseX - random(-10, 10), pmouseY - random(-10, 10));  // More fun...
    //line(mouseX, mouseY, mouseX + (mouseX - pmouseX) * 4, mouseY + (mouseY - pmouseY) * 4);  // Heading. (Also subtract.)
    //float d = 100 / dist(mouseX, mouseY, pmouseX, pmouseY);  // Use w/line below...
    //ellipse(mouseX, mouseY, mouseX / d, mouseY / d);  // One more of endless possibilities.
  }
}

void keyPressed() {
  if (key == ' ') background(255);
  if (key == 'i' || key == 'I') saveFrame();
}

void paint() {
  // Move paint stuff to here, call function in draw().
}

/*
Steps:
 1) Set up sketch w/ setup() and draw(); fill in setup().
 2) Create ellipse at mouse loc.
 3) Improve with line mouse and pmouse. Set mousePressed conditional.
 4) Set stroke per velocity, then invert.
 5) Play with transparency.
 6) Create keyboard interactivity for refresh and save image.
 7) Suggest other brush possibilities.
 8) Introduce custom function.
 9) Invite play with variations as time allows.
 */