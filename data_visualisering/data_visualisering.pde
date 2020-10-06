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
  JSONObject o = loadJSONObject("https://www.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=J3GZZZ-GZ9A7W-A389KK-4KH3");
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
