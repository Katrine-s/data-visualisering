// 3D Earthquake Data Visualization
// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/058-earthquakeviz3d.html
// https://youtu.be/dbs4IYGfAXc
// https://editor.p5js.org/codingtrain/sketches/tttPKxZi

float angle;

float r = 200;

PImage earth;
PShape globe;

void setup() {
  size(600, 900, P3D);
  earth = loadImage("earth.jpg");

  noStroke();
  globe = createShape(SPHERE, r);
  globe.setTexture(earth);
}

void draw() {
  background(51);
  translate(width*0.5, height*0.5);

  lights();
  fill(200);
  noStroke();
  //sphere(r);
  shape(globe);

}
