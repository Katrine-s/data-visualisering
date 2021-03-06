// 3D Earthquake Data Visualization
// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/058-earthquakeviz3d.html
// https://youtu.be/dbs4IYGfAXc
// https://editor.p5js.org/codingtrain/sketches/tttPKxZi
JSONObject o;
float angle;

float r = 200;

float satlatitude;
float satlongitude;
float sataltitude;

PImage earth;
PShape globe;

void setup() {
  size(900, 900, P3D);
  o = loadJSONObject("https://www.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=J3GZZZ-GZ9A7W-A389KK-4KH3");
  JSONArray values = o.getJSONArray("positions");
  for (int i = 0; i < values.size(); i++) {
    JSONObject positions = values.getJSONObject(i);

    satlatitude = positions.getFloat("satlatitude")/32;
    satlongitude = positions.getFloat("satlongitude")/32;
    sataltitude = positions.getFloat("sataltitude")/32;
    float azimuth = positions.getFloat("azimuth");
    float elevation = positions.getFloat("elevation");
    float ra = positions.getFloat("ra");
    float dec = positions.getFloat("dec");
    float timestamp = positions.getFloat("timestamp");
    boolean eclipsed = positions.getBoolean("eclipsed");

    println("funny satelite, " + satlatitude + ", " + satlongitude + ", " + sataltitude + ", " + azimuth + ", " + elevation + ", " + ra + ", " + dec + ", " + timestamp + ", " + eclipsed);
  }
  earth = loadImage("earth.jpg");

  noStroke();
  globe = createShape(SPHERE, r);
  globe.setTexture(earth);
}

void draw() {
  background(51);
  //translate(width*0.5, height*0.5);
  camera(0, 0, 700, 0, 0, 0, 0, 1, 0);
  lights();
  fill(200);
  noStroke();
  //sphere(r);
  shape(globe);
  PVector pos = cartesian(satlongitude, satlatitude, sataltitude);
  fill(255);
  translate(pos.x, pos.y, pos.z);
  sphere(5);
  text("her er den seje satellit B^)",10,10);
}

PVector cartesian (float lon, float lat, float alt) {
  lon = -lon;
  lat = -lat;
  alt += r;

  float polar = PI/2 - lat;

  return new PVector(
    alt * cos(lon)*sin(polar), 
    alt * cos(polar), 
    alt * sin(lon) * sin(polar)
    );
}
