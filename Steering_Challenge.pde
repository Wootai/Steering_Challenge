// Daniel Shiffman
// http://codingtra.in
// Steering Text Paths
// Video: [coming soon]

PFont f;

Vehicle v;
PVector p;

ArrayList<Vehicle> vehicles;
ArrayList<PVector> points;

void setup() {
  
  f = createFont("AvenirNextLTPro-Demi.otf", 192);

  vehicles = new ArrayList<Vehicle>();
  points = new ArrayList<PVector>();

  size(600, 300);
  background(51);
  textFont(f);
  textSize(192);
  fill(255);
  noStroke();
  text("train", 100, 200);
  
  for(int i = 0; i <10; i++){
    p = new PVector(300, 150);
    points.add(p);
  }

  for (int i = 0; i < points.size(); i++) {
    PVector pt = points.get(i);
    v = new Vehicle(points.get(i));
    vehicles.add(v);
    // stroke(255);
    // strokeWeight(8);
    // point(pt.x, pt.y);
  }
}


void draw() {
  background(51);
  for (int i = 0; i < vehicles.size(); i++) {
    v = vehicles.get(i);
    v.behaviors();
    v.update();
    v.show();
  }
}